---
title: "Presentation state is not game state: a refactor I had to do on myself"
description: "I built a clever server-driven menu system for TWNR, then deleted it. A short story about confusing where the UI lives with where the truth lives."
pubDate: 2026-05-11
draft: true
tags: ["twnr", "refactoring", "architecture", "lessons learned"]
---

[TWNR](https://twnr.paulabrams.ca) is a web-based remake of *Trade Wars 2002*, a multiplayer space trading game I've been building as a side project. The client is a terminal-style xterm.js interface; the server is a Node/TypeScript WebSocket and REST backend over PostgreSQL. The whole thing is meant to feel snappy — players send single keystrokes from inside their current screen (port, planet, starbase, sector view, etc.) and expect an immediate response.

This is the story of a clever idea I had early on, and the larger refactor I had to do to dig myself back out of it.

## The clever idea

Each "screen" in TWNR is really a menu: a prompt, a set of valid keystrokes, and a transition into another screen when the player presses one of them. There are a lot of these, and they nest. The port has a buy/sell submenu, the planet has commodity-take and commodity-leave submenus, the starbase has hardware and shipyards branches, and so on.

When I started building it, the obvious-feeling design was to model all of this in the database. I created three relational tables:

| Table          | What it held                                                  |
| :------------- | :------------------------------------------------------------ |
| `menu`         | One row per screen (sector, port, planet, starbase, …).       |
| `command`      | One row per command (buy, sell, warp, attack, help, …).       |
| `menu_command` | A join table linking which commands were valid in which menu. |

On each keystroke, the client sent the key to the server. The server looked up the player's current menu, joined to `menu_command` and `command`, decided what to do, and sent a response back along with the new prompt to display.

The pitch I gave myself for this design was twofold:

1. **Adding a new command was just adding a row.** Want to enable `J` to jettison cargo from the planet menu? Insert a row into `menu_command`. No code change.
2. **Help and documentation could be generated from the database.** The list of valid commands in each menu was already there as data, so I could render context-sensitive help screens, and even generate the player manual, straight out of the same source of truth.

This felt great. I told myself I was being principled — "data, not code" — and built out a few screens this way.

## The hidden cost

The first symptom was that the gameplay felt sluggish. Pressing a key in a terminal game should feel instant; mine had a noticeable lag because every keystroke was waiting on a network round-trip and a SQL query. I tried caching, and that helped some, but it didn't really address what was wrong.

The deeper symptom was that the server was doing the client's job. Almost every WebSocket message in a typical play session was about menus: *which key did you press, here's the next prompt to render, here are the commands now available*. The actual game events — buying cargo, warping, fighting — were a thin layer on top of an enormous menu-routing protocol. The wire format was noisy, the message handlers were full of presentation concerns, and the database had tables in it that were really about the UI.

Worst of all, when I tried to add features that *felt* like they should be cheap — a contextual help overlay, a status line that auto-summarized available actions — I kept having to round-trip to the server to ask "what commands are available right now?" The answer never changed unless the player moved to a different screen, but I'd architected myself into asking constantly.

## What I had actually done

The thing I had gotten wrong was a conflation that's easy to make and hard to see once you've made it. I had built a system that treated **presentation state** and **game state** as the same thing.

*Game state* is the authoritative facts about the world: where each player's ship is, what's in their cargo hold, who owns which planet, how much money is in which port's till. Those have to live on the server, because they're shared, contested, and have to survive a disconnect.

*Presentation state* is which menu the player is looking at, which submenu they've drilled into, what the prompt should say, which keys are bound right now. None of that is contested. None of it has to survive a disconnect — when a player reconnects, you can drop them back at a sensible top-level screen and the game is unaffected. It's entirely a property of the player's *current session in their browser*, and it has no business being in the server's database.

Once I saw it that way, the fix was obvious and the size of it was embarrassing.

## The refactor

I deleted the `menu`, `command`, and `menu_command` tables, along with the join queries and routing code on the server that consulted them. I moved the menu definitions into the client as plain TypeScript modules — one per screen — each owning its own prompt rendering, its own keystroke handlers, and its own transitions to other screens.

The server protocol shrank to the things that actually need to be authoritative: *I want to warp to sector 42*, *I want to buy 50 units of fuel ore*, *I want to fire on the player in this sector*. The server validates, mutates game state, persists, and replies. It no longer has any opinion about what menu the player is looking at, and it doesn't need to.

The effect on the codebase was bigger than I expected. The handler files dropped a lot of branching. The wire protocol's message types collapsed into a much smaller set. Contextual help became trivial — the client already knows what menu it's in, so it just renders the help for that menu from a local object. The lag is gone. Adding a new command is now a small client-side change instead of a row insert plus a server-side reload.

## What I'd take from this

The seductive part of the original design was that it sounded *principled*. "Data not code." "Single source of truth." "Generate docs from the database." Those are all real virtues, but I'd applied them to the wrong layer — I'd made the database authoritative over a thing that wasn't actually shared, persistent, or contested. The principles weren't wrong, the scope was.

The other lesson is one I keep relearning: the highest-leverage edit on a codebase is often a deletion, not an addition. Three tables, a bunch of join queries, a stack of menu-routing code on the server, all gone — and the system got faster, smaller, and easier to reason about. I try not to be precious about code I've written, including code I was once proud of. If it turns out to be in the wrong place, the kindest thing I can do for my future self is take it back out.

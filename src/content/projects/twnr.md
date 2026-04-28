---
title: "TWNR — Space Trading Game"
tech: ["TypeScript", "Node.js", "Express", "PostgreSQL", "WebSockets", "JWT", "Vite", "xterm.js", "Docker"]
category: "software-development"
image: "/assets/twnr-Screenshot_20260427_213441.png"
url: "https://twnr.paulabrams.ca"
order: -1
---
A web-based remake of the classic *Trade Wars 2002* BBS door game: an online multiplayer space trading and combat sandbox. Players warp between sectors, trade commodities at ports, build planets and starbases, and fight other players across a procedurally generated universe.

Architected and built end-to-end as a TypeScript monorepo: an Express + WebSocket server backed by PostgreSQL, and a terminal-style xterm.js client served by Vite. Authoritative game state lives on the server; the client is a thin renderer driven by a typed message protocol with JSON-Schema-generated documentation.

This is a pre-alpha demo; playable today, but not yet open to public sign-ups.

- [Live Demo](https://twnr.paulabrams.ca)

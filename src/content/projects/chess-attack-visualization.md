---
title: "Chess Attack Visualization"
tech: ["React", "TypeScript", "Lichess API", "OAuth2", "REST"]
category: "personal-projects"
image: "/assets/chess-Screenshot_20260221_103312.png"
url: "https://pabrams.github.io/chess-attack-visualization"
order: 1
---
A specialized chess training app that visualizes white and black attackers on any square. Built with my [fork of chess.js](https://www.npmjs.com/package/@pabrams/chess.js/v/1.5.4) and integrated with the [Lichess.org](https://lichess.org) API.

When solving mate-in-1 problems, the app automatically shows a visualization of exactly how the enemy king is restricted. Over time, this helps burn checkmating patterns into the brain, solidifying neural pathways so you never miss the pattern during competitive play.

The "x-ray" attacker support (pieces attacking through their own and the opponent's pieces, the foundation of battery analysis) wasn't in upstream `chess.js`. I diagnosed the gap by setting a React-lifecycle breakpoint to capture the FEN at the moment of incorrect rendering, wrote a failing unit test against the upstream library, and opened [PR #572](https://github.com/jhlywa/chess.js/pull/572) implementing it. Published a fork to npm as `@pabrams/chess.js` so the visualization could ship without waiting on the upstream merge.

- [Live Demo](https://pabrams.github.io/chess-attack-visualization)
- [Source Code](https://github.com/pabrams/chess-attack-visualization)
- Earlier exploration of the same idea: [marked-chessboard](https://pabrams.github.io/marked-chessboard/)

---
title: "Chess.js (Fork)"
tech: ["Node.js", "TypeScript", "JavaScript", "Jest", "npm"]
category: "personal-projects"
url: "https://www.npmjs.com/package/@pabrams/chess.js/v/1.5.4"
image: "/assets/chess-Screenshot_20260221_103415.png"
order: 2
---
My [published fork of chess.js](https://www.npmjs.com/package/@pabrams/chess.js/v/1.5.4) which extends the popular chess library with features for analyzing board control:

- **X-ray attack detection**: identifies pieces that attack through other pieces
- **Piece battery analysis**: accounts for aligned pieces when determining the number of attackers on any given square
- Comprehensive test suite with Jest

The same x-ray support is also proposed upstream as [chess.js PR #572](https://github.com/jhlywa/chess.js/pull/572). The fork was published so the [Chess Attack Visualization](https://paulabrams.ca/chess-attack-visualization) app could ship without blocking on the upstream merge.

- [npm Package](https://www.npmjs.com/package/@pabrams/chess.js/v/1.5.4)
- [Source Code](https://github.com/pabrams/chess.js)

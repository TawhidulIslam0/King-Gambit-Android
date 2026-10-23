# ♔ King's Gambit — Medieval 3D Chess

> ⚔️ **A cinematic 3D chess game where armies march, spells ignite, muskets fire, and kingdoms fall.**

A cinematic 3D chess game in the browser. Rival civilisations — a medieval European **Ivory Kingdom** 🏰, a Mesoamerican **Sun Empire** ☀️ and Napoleonic France's **Grande Armée** 🎖️ — face each other as sculpted, rigged characters that march, strike, scream and burn away into dust on a marble-and-basalt board.

**Either side can muster any of the three armies.**

Built with **Vite + React 19 + TypeScript + three.js**, [chess.js](https://github.com/jhlywa/chess.js) for the rules, and a **Web Worker** search engine for the computer opponent.

> 🧩 **No backend · No account · No build-time asset pipeline · Static site**

---

Live Application: https://tawhidulislam0.github.io/medieval-chess-game-3d/


## 📜 Table of contents

* ⚔️ [Features](#features)
* 👑 [Promotion](#promotion)
* 🎮 [Controls](#controls)
* 🖥️ [Interface](#interface)
* ♟️ [Game modes](#game-modes)
* 🏰 [Armies](#armies)
* 🌍 [Battlegrounds](#battlegrounds)
* 📁 [Project structure](#project-structure)
* 🧠 [The computer opponent](#the-computer-opponent)

---

## ⚔️ Features

* ♟️ **Full chess rules** — castling, en passant, promotion, check, checkmate, stalemate, threefold repetition, the fifty-move rule and insufficient material, all via chess.js.

* 🧍 **Rigged 3D characters, not chess pieces** — eighteen sculpts (six per army), each with `idle`, `walk`, `attack` and `death` skeletal clips, plus weapons, shields and a floating rank crest.

* 🔵 **The two armies are never in doubt** — every figure stands inside a band painted on its tile and carries a faction rim light along its silhouette: azure for the near side, ember for the far one. The band's *shape* differs as well as its colour (a plain double band against a spiked sun collar), so the two sides stay separable for a colour-blind player, on a phone, in the darkest map, and in a mirror match where both sides muster the same sculpts.

* 🏰 **Three army skins, chosen per side** — Ivory Kingdom, Sun Empire or the Grande Armée, each with its own six sculpts, clips, weapon family and voices. Swap either side at any time in **Settings → Armies**; the choice is remembered between visits.

* 🚶 **Figures march, they do not slide** — a moved piece turns to face its destination, walks the distance on its own legs at the cadence of its rank, and squares up again on arrival. Knights keep the leap, running through the air and landing on both feet.

* 👣 **Synthesised footsteps on the stride clock** — every footfall is fired by the same clock that retimes the walk cycle, so sound, grit puff and foot all land together: scuffs for footsoldiers, leather for the clergy, plate for the tower guardians, a slow deliberate tread for the crown.

* ⚔️ **Cinematic captures** — the camera punches in, the attacker strikes on the hit frame, sparks fly, the screen shakes, and the defender **burns away from the soles upward** through a ragged edge of light, shedding motes that drift off (cold soul-light for the Kingdom, live embers for the Empire).

* 🏳️ **The square changes hands** — the moment a victor's boot comes down on the tile it has just cleared, its own colours **close inward** over the square (every other ring on this board travels outward, so the reversed motion is unmistakable), the army's mark seals under it, chips of the old occupant's stone are thrown up, and the figure draws itself up to full height.

  Over the top of it, a short brass motif rises a perfect fifth — the one sound in the game that means *conquest* rather than violence.

  All of it is keyed to **what was taken**, so trading a footsoldier never sounds like felling a queen.

* 💥 **A blow that scales with rank** — the footsoldier stabs and moves on; the rider cuts on the charge and leaves an arc of steel hanging in the air; the tower guardian's hammer sends a wave rolling across the stone and the hall keeps shaking afterwards; the crown drops a **column of light on the condemned**, rings a bell over it, and executes it in gold.

  Each rank has its own lens punch, hitstop, swing weight and aftershock.

* 🔥 **Casters kill at range** — the queen and the mage never close the distance. They level the staff from their own square, gather fire at the crystal, and throw it down the line: it lights the hall as it flies, breaks open on the body, and only once the corpse has burned away do they walk the whole distance and take the square.

  The mage throws **one** bolt; the sorceress throws a **volley of three** and leaves a ring of fire burning on the square (cold witchfire for the Kingdom, sunfire for the Empire).

* 🗣️ **Eighteen death cries** — one recorded voice per rank per army, panned to where the body is on screen, ducking the music for a beat and pitch-jittered so no two deaths sound alike.

  Each army dies in its own language of pain: the Ivory Kingdom roars and groans, the Sun Empire shrieks and hisses, and the Grande Armée — being shot rather than struck — has the air punched out of it first and the voice second.

* 🚨 **The check alarm** — the instant a king falls under the sword, the hall itself reacts: a red lamp lights over the threatened crown, red light bleeds in from the far edges of the screen, and the camera picks up a faint low rumble.

  It is deliberately quiet: the surge is gone in under a second, the wash never reaches the board, and the lamp then keeps breathing at a low level for as long as the king stays in check.

  A warning has to be noticed, not endured — the alarm names the crown in danger without tinting the figures or moving the board under the player's eye.

* 🌎 **Four battlegrounds** that relight the whole world — sky, haze, stone colour, tile contrast, fires, birds, siege engines and the film grade.

* 🗺️ **2D tactical view** — one key lifts the camera straight overhead and flattens every figure into a stamped counter, so nothing can hide a square. Selection and moving keep working.

* 🧠 **Three engine strengths** running off the main thread, so the render loop never blocks.

* 🤖 **AI vs AI / attract mode** — let two engines duel on their own with pace control, pause, auto-rematch, and a clean capture view with the entire interface hidden.

  Three camera behaviours: hold one angle, follow the figure on the move and close in on the fight, or drift slowly around the board.

  The follow rig **leans** towards the action instead of chasing it into the hall wall, so the picture no longer shudders while it tracks.

  AI vs AI also renders crisper than a played game — no depth of field, softer grain, vignette and bloom.

  Every AI vs AI duel now **ends with a verdict card**: who won and how, the two engine strengths, the record, a countdown on the next duel that can be held, and one tap to roll another duel or return to the hall.

* 🎛️ **An interface that stays off the board** — icon-only controls with a themed tooltip on every one of them (name, one-line explanation, key cap), the move record folded into a corner sigil, and a slim showcase rail that collapses to a single icon.

  One key strips the whole overlay for recording.

* ⚙️ **Auto-detected graphics presets** (Low → Ultra) with an automatic step-down if the measured frame rate stays low, plus WebGL context-loss recovery.

* ⏱️ **Chess clocks**, undo, resign, flip board, copyable PGN, captured tray with material score.

* 📊 **Field tally** in the top-left corner: figures lost and time on the field for each army, ticking live even in an untimed duel.

---

## 👑 Promotion

When a pawn reaches the final rank, a selection picker activates:

* 🏛️ **Interactive Plinths** — Tap or click one of the four candidate plinths turning on the board, each carrying a plate naming the rank.

* ⌨️ **Keyboard Shortcuts** — Alternatively, press `Q` (Queen), `R` (Rook), `B` (Bishop), or `N` (Knight), or use number keys `1` through `4`.

---

## 🎮 Controls

| Action                   | Input                                                                                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 🌀 Orbit / zoom          | Drag, mouse wheel (one-finger drag and pinch on touch)                                                                                                                                                 |
| 📱 Playing on a phone    | Nothing to set: the framing, the lens and the orbit limits are solved for the screen (see [Fitting the hall to the screen](#fitting-the-hall-to-the-screen))                                           |
| 🧍 Select a figure       | Click it — legal squares glow green, captures red                                                                                                                                                      |
| 👣 Move                  | Click a highlighted square, even one hidden behind a figure (click the figure again to deselect)                                                                                                       |
| 👑 Promotion             | Tap one of the four candidates turning on their plinths — each carries a plate naming the rank — or press `Q` `R` `B` `N` (`1`–`4`), see [Reading the promotion picker](#reading-the-promotion-picker) |
| 🎥 Camera & battleground | Camera icon in the top bar — Ivory / Obsidian / Overhead / Cinematic, flip, tactical, and the four arenas                                                                                              |
| 💬 What a button does    | Hover or focus it (tap it on touch) — every icon carries a tooltip                                                                                                                                     |
| ⏭️ Skip the intro        | Click anywhere during the opening sweep                                                                                                                                                                |
| ⚙️ Settings              | Gear icon — armies, battleground, graphics preset, capture cinematics, board swing, sound                                                                                                              |

There is no drag-and-drop: a press that travels more than 8px (16px for a finger — a tap on glass always drifts) is read as a camera swing, so orbiting from a figure never moves it.

Selection and moves both resolve on release.

Keyboard shortcuts (ignored while typing in a field, and **not printed on a phone** — see [Key hints only where there are keys](web/README.md#key-hints-only-where-there-are-keys)):

| Key     | Action                                                              |
| ------- | ------------------------------------------------------------------- |
| `F`     | Flip the camera to the other side                                   |
| `T`     | Toggle the 2D tactical view                                         |
| `H`     | Open / fold the chronicle (move record and spoils)                  |
| `C`     | Toggle cinema mode (hide the entire interface)                      |
| `Space` | Pause / resume playback in showcase mode                            |
| `Esc`   | Close the settings panel, camera menu, chronicle or an open tooltip |

**📱 A phone is never told to press a key.**

Every hint above — the key caps in the tooltips, the `(T)`/`(F)`/`(C)` reminders, the promotion banner's *OR PRESS Q R B N*, *SCROLL TO ZOOM*, *CLICK TO SKIP* — used to be printed on touch devices too: **13 places naming a key or a mouse gesture the device does not have**, on the screen with the least room to waste.

They now check first, and a tablet that gets a case keyboard earns its key caps back the first time a real key arrives.

Where the gesture differs the wording follows the hand: *PINCH TO ZOOM*, *TAP TO SKIP*, *TAP A FIGURE*.

---

## 🖥️ Interface

The board owns the screen; every panel is either short, in a corner, or foldable.

| Region          | What lives there                                                                                                                                                                                                             |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 🔵 Top left     | Whose turn it is, the thinking pulse, the check banner, the showcase duel counter — and the field tally under it                                                                                                             |
| 🟠 Top right    | Clocks, then the icon rail — take back, resign, new duel, sound, fullscreen, flip, tactical, camera menu, settings                                                                                                           |
| 📜 Right flank  | The rail: spoils (both captured trays and the material score) under the bar, then the **move record** running down the rest of the flank beside the board. Desktop and tablet only — on a phone both fold into the chronicle |
| 📖 Bottom left  | The chronicle sigil — a corner button with a move counter that shows or hides the record (`H`)                                                                                                                               |
| 🎬 Bottom right | The showcase rail, only during a showcase duel                                                                                                                                                                               |

---

## ♟️ Game modes

| Mode                      | What it is                                                                                                                                           |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| 🧙 **Player vs Computer** | Pick your colour, an engine strength and an optional clock                                                                                           |
| 👥 **Two players**        | Hotseat on one screen; the view **holds still** — flip it by hand with `F`, or switch on the automatic swing between turns (see below)               |
| 🤖 **AI vs AI**           | Two engines duel on their own — per-side strength, 0.5×–4× pace, auto-rematch, still / follow / orbit camera, foldable rail, verdict card at the end |
| 🎭 **Attract**            | Leave the menu alone for 30 seconds and an AI vs AI duel starts behind it                                                                            |

Clocks: none, 5, 10 or 15 minutes, drawn as draining hourglasses.

---

## 🏰 Armies

Each side picks its army independently in **Settings → Armies** (near side / far side).

An army skin is a whole civilisation: six sculpts, their skeletal clips, a weapon family and a set of death cries.

| Id       | Army                 | King → pawn                                                                                  | Arms                                                                                                                                                                                                                                                                                                                                              |
| -------- | -------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ivory`  | 🏰 **Ivory Kingdom** | King, Queen, Mage, Knight, Guardian, Footman                                                 | Greatsword, crystal sceptre and staff, warhammer, spear, heater / tower / round shields                                                                                                                                                                                                                                                           |
| `sun`    | ☀️ **Sun Empire**    | Emperor, Priestess, Serpent Priest, Jaguar Warrior, Temple Guardian, Eagle Warrior           | Macuahuitl, sun sceptre, serpent staff, basalt maul, tepoztopilli, feathered chimalli                                                                                                                                                                                                                                                             |
| `empire` | 🎖️ **Grande Armée** | Napoléon, Imperial Commander, Marshal-Tirailleur, Cuirassier, Artillery Guard, Line Infantry | **Sculpted, not built** (see [The Napoleonic arms](#the-napoleonic-arms)): An XIII officer's flintlock and a general's dress sabre, a second flintlock over the Marengo presentation sword, the 1793 Versailles rifled carbine, the An XI cuirassier sword, empty hands behind a towed field gun, and the Charleville 1777 with the bayonet fixed |

---

## 🌍 Battlegrounds

Switchable at any time from the camera menu or Settings; each one is a complete relight.

| Id       | Name                        | Look                                                                              |
| -------- | --------------------------- | --------------------------------------------------------------------------------- |
| `jungle` | 🌴 **Sun Temple** (default) | Rainforest clearing, jade canopy, drifting pollen, two gold-crowned step pyramids |
| `dawn`   | 🌅 **Dawn Court**           | Golden morning light, pale sky, warm stone — highest legibility                   |
| `frost`  | ❄️ **Frostfall**            | Overcast snowfield, cold flat light, hardest contrast on the sculpts              |
| `dusk`   | 🔥 **Siege at Dusk**        | The original torch-lit siege — moodiest, heaviest bloom                           |

---

## 📁 Project structure

```text
├── public/             icon, favicon, banner.jpg (share card), robots.txt (drop local .glb models here)
└── src/
    ├── core/           chess state — never imports three.js
    │   ├── gameController.ts   owns chess.js, clocks, undo, AI turns, snapshots
    │   ├── types.ts             MoveEvent, GameSnapshot, LedgerMove, …
    │   └── emitter.ts           tiny typed event emitter
    │
    ├── ai/
    │   ├── engine.worker.ts    negamax + alpha-beta + quiescence + iterative deepening
    │   └── aiClient.ts         main-thread handle, cancels stale searches
    │
    ├── scene/          three.js only
    │   ├── sceneEngine.ts      renderer, camera, interaction, move animation, cinematics
    │   ├── environment.ts      hall, lighting, torches, particles, PMREM environment
    │   ├── arena.ts             the four battleground looks and their ordering
    │   ├── battlefield.ts       siege props, camps, fires, birds
    │   ├── jungle.ts             canopy, palms, vines, pollen for the Sun Temple
    │   ├── board.ts              tiles, base, engraved labels, highlight pool
    │   ├── pieces.ts             rigged GLB loading, clips, faction materials, mixers
    │   ├── weapons.ts            arms per rank: primitives, loadouts, hand/bone mounting
    │   ├── armoury.ts            fits the generated Napoleonic weapons into the prop frame
    │   ├── gltfQueue.ts          the one download window every GLB fetch shares
    │   ├── rankBadges.ts         floating heraldic crests, flat map tokens
    │   ├── effects.ts            particle bursts, flashes, dissolve, camera shake and rumble
    │   ├── alarm.ts              the red lamp that stands over a king in check
    │   ├── strikes.ts            per-rank blow visuals (slash arc, ground wave, pillar)
    │   ├── spells.ts             fireball orbs, per-army fire, the shared light pool
    │   ├── gunfire.ts            muzzle flashes, rounds in flight, powder smoke banks
    │   ├── ammunition.ts         the four rounds: pistol/musket ball, Minié bullet, iron round shot
    │   ├── postfx.ts             EffectComposer pipeline (bloom, SSAO, DOF, grade, SMAA, clarity)
    │   ├── textures.ts           procedural marble, basalt, bronze, cloth
    │   ├── quality.ts            graphics presets + auto-detection
    │   ├── viewport.ts           solves the camera framing for the screen it is drawn into
    │   └── tween.ts              promise-based tween engine
    │
    ├── ui/             React + CSS overlay
    │   ├── GameShell.tsx        phases, settings, attract mode, keyboard shortcuts
    │   ├── MainMenu.tsx         mode / colour / strength / clock / muster selection
    │   ├── Hud.tsx              top bar, field tally, spoils, chronicle sigil, showcase rail
    │   ├── Tooltip.tsx          themed tooltip for the icon-only controls
    │   ├── MoveLedger.tsx       the chronicle: move list, PGN, hover preview
    │   ├── Muster.tsx           army + battleground pickers, and their locked in-match view
    │   ├── SettingsPanel.tsx    muster (out of match), graphics, picture, cinematics, sound
    │   ├── Heraldry.tsx         crests, hourglasses, piece glyphs
    │   └── medieval.css         the whole overlay's look
    │
    ├── audio/          Web Audio mixer with layered score stems
    ├── assets/         army skins: model / clip / voice URLs per civilisation
    └── components/ui/  shadcn/ui primitives
```

### 🧠 State

There is exactly one source of truth (`GameController`). React reads it through the `useGameSnapshot` hook, which subscribes to the emitter and returns the latest snapshot — no global store, no prop drilling of game state into the scene.

---

## 🧠 The computer opponent

| Difficulty               | Search                                                                | Budget  |
| ------------------------ | --------------------------------------------------------------------- | ------- |
| 🟢 **Easy** — *Squire*   | Random legal move, prefers captures, always takes a mate in one       | instant |
| 🟡 **Medium** — *Knight* | Depth 3 negamax + alpha-beta, material + piece-square tables          | 0.7 s   |
| 🔴 **Hard** — *Warlord*  | Depth 5 iterative deepening, MVV-LVA ordering, quiescence on captures | 3.2 s   |

All searches run inside `engine.worker.ts`. `aiClient.ts` cancels a stale search whenever the position changes, so undo and resign are instant.

---

> ⚔️ **Muster your army. Choose your battlefield. Make your move.**
>
> **King's Gambit** — where chess becomes war.

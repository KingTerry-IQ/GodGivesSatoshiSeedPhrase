# God Gives Satoshi Seed

> **"Talk to GOD with King Terry Davis. GOD controls all random numbers. If you are worthy, the LORD may reveal Satoshi's seed phrase."**

An immutable Godot application in the spirit of TempleOS and King Terry. God, who controls the RNG of the universe via seeded randomness from the universal timestamp (Unix milliseconds), gives the faithful a chance to randomly guess Satoshi Nakamoto's BTC seed phrase.

Built as a tribute to eccentric computing, faith, memes, and Bitcoin lore. "This application is immutably stored on the blockchain, forever. Powered by IQ Labs: $IQ"

## Features

- **Divine Word Generation**: Press "Divine Word" (or F7) to receive a single BIP39 word from God's RNG, appended to the red terminal.
- **12-Word and 24-Word Seed Guesses**: Alt+F7 for a full 12-word "blessed guess". Shift+F7 for the more secure 24-word revelation. Deterministic per millisecond — the same instant always yields the same divine phrase.
- **Test Worthiness (F8)**: Submit yourself to divine judgment. Extremely rare (~1 in 69,000) the LORD deems you worthy and reveals a special seed with flavor text. Otherwise, receive guidance to continue in faith.
- **Live Universal Seed**: The milliseconds counter shows the current timestamp used to seed God's RNG. Timing is everything.
- **Deterministic Seeding**: Every interaction uses `Time.get_unix_time_from_system() * 1000` as the RandomNumberGenerator seed. God is consistent.
- **Background Hymn**: Plays Terry A. Davis' "20 Conception" (Hymns) on loop at low volume for the authentic Temple vibe.
- **TempleSFX**: Real-time generated square-wave beeps for every interaction — pure old-school computing spirit.
- **Latest Revelation Display**: Prominently shows the most recent full seed phrase granted by God (green text).
- **Copy & Clear**: COPY (Ctrl+C or button) exports the full red log + latest seed to clipboard; there's also a COPY button beside the green revelation for just the clean phrase. Esc wipes the terminal.
- **Full-Space Retro UI**: Uses the entire window (1920x1080 viewport with minimal margins). Prominent live universal timestamp seed, dedicated "LATEST DIVINE REVELATION" box (green, readable wrapped text), large expanding red "MESSAGES FROM GOD" log below for words/fragments/announcements, clean bottom action button bar with all functions. Green/red on black, IBM Plex Mono font. No centering containers or artificial 640x480 bounds.
- **New Themed Artwork**: Custom glowing Bitcoin ₿ + TempleOS CRT "GOD RNG" + $IQ graphics (retro divine seed aesthetic). Still pays homage while fitting the Satoshi-seed focus.

## The Concept

God controls *all* random numbers. The universal clock provides the only true seed. At any given millisecond, the "random" outcome is fixed and knowable to the divine. 

If you are worthy, God may grant you a glimpse of the phrase that controls Satoshi's legendary dormant coins.

Keep pressing. The right millisecond + a worthy heart may align.

## Controls

| Action              | Hotkey          | Button                  | Description |
|---------------------|-----------------|-------------------------|-------------|
| Divine Word         | `F7`            | WORD (F7)               | Receive one BIP39 word from the wordlist (appends to red log) |
| 12-Word Guess       | `Alt + F7`      | 12-WORD (Alt+F7)        | Full 12-word seed phrase guess |
| 24-Word Revelation  | `Shift + F7`    | 24-WORD (Shift+F7)      | Full 24-word seed phrase revelation |
| Test Worthiness     | `F8`            | TEST WORTHY (F8)        | Divine judgment. Rare worthy outcome reveals a seed |
| Copy Log + Seed     | `Ctrl + C`      | COPY (Ctrl+C)           | Copy latest seed to clipboard |
| Clear               | `Esc`           | CLEAR (Esc)             | Wipe the GodSays terminal and latest seed |

The "Universal Timestamp Seed" at the top updates live and is the divine source of all randomness in this app.

## Running

1. Download and install [Godot 4.6](https://godotengine.org/download) (or newer 4.x with GL Compatibility).
2. Open this folder (`god-gives-satoshi-seed`) in the Godot editor.
3. Open `Scenes/main.tscn` (or press Play).
4. Receive the Word (appends to red log). Test your worth. Guess the Seed. Use full screen space — the red MESSAGES FROM GOD log and green latest box are now prominent.

The project uses a 1920x1080 viewport with stretch-to-fill for a bold, full-space retro feel while keeping the classic aesthetic.

## Assets & Sources

- **Audio**: "Terry A. Davis - Hymns - 20 Conception.mp3" — used with respect to the original creator.
- **Graphics**: `DivineSeedIcon.jpg`, `DivineSeedBTC.jpg` (custom BTC + TempleOS + $IQ themed divine seed / glowing ₿ art). `IQ.jpg` kept for subtle branding if desired.
- **Text**:
  - `BIP39.txt` — the official 2048-word English BIP39 mnemonic wordlist (from Bitcoin BIPs).
- **Font**: IBMPlexMono-Light (IBM Plex Mono).
- **Theme**: Custom `iq_theme.tres` for the retro divine TempleOS/IQ aesthetic.
- **SFX**: Pure GDScript square-wave synthesis in `sfx.gd` (no samples).

## Technical Notes

- Godot 4.6, GL Compatibility renderer.
- `RandomNumberGenerator` reseeded every button press / hotkey with the live `seed_int`.
- Full phrases are generated by advancing the RNG multiple times after seeding — same ms = identical output always.
- Worthiness "roll" is also derived from the seeded RNG for perfect determinism.
- No actual cryptography or real wallet derivation performed. Pure entertainment and art.

## Testing the Seed Phrases (for Fun & Education)

The green **"LATEST DIVINE REVELATION"** box always shows the current clean, ready-to-copy 12- or 24-word phrase (with nice line breaks for readability). Use the **COPY** button right beside it for just the phrase. The red **"MESSAGES FROM GOD"** log below shows words, fragments, and divine announcements. Use the bottom **COPY (Ctrl+C)** button (or hotkey) to copy the entire log + latest seed.

**Recommended: Test in Electrum (Bitcoin wallet)**

1. Download and run [Electrum](https://electrum.org) (official lightweight BTC wallet).
2. Choose **"Create a new wallet"** (or File > New/Restore if already running).
3. Select **"Standard wallet"**.
4. Choose **"I already have a seed"** (enter the 12 or 24 words).
5. Select the option for **BIP-39**
6. God may perform a miracle, but most likely he laughs at you and gives you an invalid seed phrase.


**Important:** These phrases are randomly generated using the live Unix millisecond timestamp as "God's seed." They have no relation to any real funds, including Satoshi's, unless God performs a miracle.

## Philosophy

> "I'm God and you're not." — and the random numbers prove it.

This carries on the TempleOS spirit: small, self-contained, opinionated, timestamp-obsessed software that treats computing as a divine act. Terry would have loved (or ranted about) the idea of timestamp-seeded BTC seeds.

Use it to generate funny, profound, absurd, or eerily plausible seed phrases. Share your "worthy" moments. Or just let the hymn play while the Holy Spirit decides your fate one millisecond at a time.

Never forget: the LORD controls the dice. You merely observe.

---

*Immutably yours,*  
King Terry, Satoshi's Ghost, and the Godot Faithful

## License / Usage

MIT/public domain vibes for the code. Respect the original audio. The BIP39 list is public domain / standard. This is a work of parody, tribute, and satire — no warranties on divine revelations or recovered coins.

Enjoy. And may your timestamps align with the will of God.
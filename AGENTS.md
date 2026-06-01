# AGENTS.md — Context for AI Agents

Read this first if you're an AI agent picking up this project.

## What this project is

A physical furniture project: a steel-and-wood stand for 3D printers, designed
to be built by the owner with hand tools and an entry-level flux-core welder,
then assembled in-place in a kitchen-adjacent room. **There is no software in
this project.** The deliverables are:

- An OpenSCAD model (`printer_stand.scad`) for visualization and verification
- Markdown documents capturing the design (`SPECS.md`, `DESIGN.md`, this file)
- Eventually: a cut list, a welding sequence document, possibly a shopping list

Future agents will probably be asked to refine dimensions, add detail to the
OpenSCAD model, generate a cut list, write a welding-sequence guide, or
reconsider design choices.

## Owner context

- **Woodworker by hobby.** Will build the wood top and shelves himself.
  Don't propose wood-attachment schemes that ignore wood movement (this has
  already been corrected once — it's a hard rule).
- **First-time welder** with an entry-level flux-core / stick welder. Design
  choices favor burn-through margin and forgiving joint geometry over
  optimal weight. Don't propose joints that require precise cuts or thin
  wall stock.
- **Cares about looks.** Aesthetic considerations are first-class. The
  tube-on-ends, cable-on-back hybrid is partly a structural decision, partly
  a visual one. Don't strip aesthetic features in the name of pure
  efficiency without flagging the trade-off explicitly.

## Hard constraints (do not violate)

These are repeated from `SPECS.md` because they're load-bearing for every
design decision:

1. **Wood top is exactly 48" × 25.75".** Frame shrinks, top doesn't.
2. **Top must match adjacent kitchen counter height (37") exactly.**
3. **Stand must disassemble** to pass through 28"W × 74"H doorway with 37"
   of pivot space in front of it.
4. **Wood top must be allowed to move seasonally.** No rigid attachment.
5. **Front face is open** — printer lives there, no diagonal bracing on
   front.
6. **AMS 2 Pro must be side-mounted on the printer**, not on top of it.
   Ceiling has pipes; can't go higher.

## Things already considered and decided — don't relitigate without reason

- 1.5"×1.5"×0.120" wall tubing chosen over thinner stock — burn-through
  margin for flux-core, not strength.
- Flange plates use **asymmetric thickness**: 3/8" tapped on the leg
  (plate A) + 3/16" clearance on the stretcher end (plate B). Owner
  pushed back on initial 1/4" plates as overbuilt; the asymmetry was the
  resolution.
- Flange plates are **1.5"W × 5"H tall narrow columns** aligned with leg
  width — *not* 3"×3" squares. Owner-driven aesthetic + structural choice.
  All 12 plates identical (no per-stretcher variation).
- **2 bolts per joint, not 4.** Owner pointed out 4 was overbuilt; 2 bolts
  cuts hardware count in half (24 total), simplifies assembly, resolves
  bolt-tube collision on middle/bottom plates.
- **Top stretcher bolts both go below the tube** (plate top flush with leg
  top leaves no room above). Middle/bottom bolts straddle the tube.
- Bolts thread **directly into tapped plate A** — no separate nuts, no need
  to access back side. Bolt tip stops inside plate A.
- **Do NOT tap through the leg wall.** Drill 1/2" relief holes through the
  back wall of the leg behind each tapped plate-A hole, for bolt-tip
  clearance. Tapping through 0.120" wall = useless thread engagement and
  cross-threading risk.
- **No knee braces.** Considered and dropped — structurally redundant
  given welded rectangular corners + end-frame diagonals + cable X +
  2-bolt joint moment resistance. The lever arm between top-joint bolts
  already gives ~50:1 safety factor for top-joint racking.
- **Plywood shelves drop onto 3/4"x3/4"x1/8" angle iron ledgers** welded to
  the inboard top edge of front and back long stretchers (bottom and middle
  shelf levels). Plywood top flush with steel tube top. No angle on
  end-frame cross-tubes (3/4" ply spans the 17.25" depth without sag).
  Gravity holds plywood down; no fasteners.
- Cable X on back chosen over tube diagonal — aesthetic + lighter; tube
  remains an option.
- Tube diagonals on end frames chosen over cables — A1 bedslinger loads
  the end-frame plane heavily, cables would be marginal there.
- End-frame diagonal in the **lower bay** (not upper). **True 45°**, single
  45° miter at each end — chosen because 45° is the only non-90° angle the
  owner can lay out and cut accurately (speed square + angle grinder, no
  protractor). Runs back-top → front-bottom; since the bay is wider than
  tall, it lands on the bottom stretcher ~1.5" short of the front leg. Both
  end frames matched (same orientation). Earlier corner-to-corner ~42.6°
  was dropped because it required hard-to-cut, non-45° miters.
- H_MIDDLE = 23.75" gives 10" upper-bay clearance and 17.25" lower-bay
  clearance (fits 8" filament spools standing up).
- Flange-plate joints chosen over tube-in-tube sleeves — easier for a
  beginner welder, more forgiving on cut accuracy.
- Levelers chosen over casters — rigidity priority. Caster conversion path
  is preserved (chop legs, weld plates). Nominal lift set mid-range (~1") so
  the feet absorb build error both ways. **Primary height control is cutting
  the legs to final length at assembly** (cut long, trim the bottoms after
  dry-fit — all flange plates sit at/above H_BOTTOM = 5", so trimming touches
  no joint). Do NOT fix big height errors with stud extension (a long
  extended stud reintroduces wobble).
- **Overhangs are split:** sides (L/R, X) and front/back (Y) are independent
  variables (`OVERHANG_LR`, `OVERHANG_FB`), both default 2". They drive the
  steel footprint (FRAME_LENGTH, FRAME_DEPTH).
- Wood mounted via slotted holes + threaded inserts + fender washers —
  allows seasonal movement, allows clean removal.

If you propose changing any of these, explain *why* the original reasoning
no longer applies before suggesting an alternative.

## Useful conventions

- **Units:** inches throughout. The OpenSCAD model uses inches.
- **Coordinate system in OpenSCAD:**
  - X = long direction (48" — wood length)
  - Y = depth (25.75" — front-to-back)
  - Z = height (0 = floor, 37 = top of wood)
  - Origin is at floor, centered on the stand footprint
  - +Y = back, −Y = front
- **"End frame"** = welded subassembly perpendicular to the long (X) axis.
- **"Long stretcher"** = bolted member running along the X axis between
  the two end frames.
- **Knockdown** = disassemblable. Uses bolted flange-plate joints.

## What good looks like for future work

- **If asked for changes:** edit `printer_stand.scad` and update the
  relevant MD file in the same response. Keep them in sync.
- **There are TWO SCAD files** — `printer_stand.scad` (cable X back) and
  `printer_stand_zback.scad` (Z-tube back panel). They must stay in sync
  except for the back-bracing. If a design change touches anything
  upstream of the back face (legs, end frames, stretchers, plates,
  ledgers, shelves, top), update BOTH files. The owner is comparing the
  two visually and hasn't picked yet.
- **The SCAD models STEEL ONLY.** The wood top and plywood shelves are NOT
  drawn (cut to fit after the frame is built); the wood dimensions are kept
  as variables only because they drive the steel footprint via the
  overhangs. The angle-iron ledgers (the plywood supports) ARE modeled.
  Keep it that way unless the owner asks otherwise.
- **If asked to add a cut list:** the comment block at the bottom of
  `printer_stand.scad` already has one — refine it there or migrate to a
  dedicated `CUT_LIST.md`.
- **If asked to reconsider a design choice:** re-read this file's
  "already considered" list first. Surface the trade-off; don't silently
  flip a decision.
- **If asked structural questions:** assume the owner wants engineering
  reasoning, not just an answer. He pushes back when math is overbuilt;
  he also pushes back when something is underbuilt for the use case.
- **Don't propose plywood backs, hardwood-glued-down tops, or any other
  feature that has been explicitly ruled out** in earlier conversation.

## Files in this project

| File | Purpose |
|---|---|
| `printer_stand.scad` | OpenSCAD 3D model — cable-X back variant |
| `printer_stand_zback.scad` | OpenSCAD 3D model — Z-tube back-panel variant |
| `SPECS.md` | Hard requirements and dimensions |
| `DESIGN.md` | Design rationale and decisions |
| `TOOLS.md` | Tools and PPE — what the owner has, what to acquire |
| `SHOPPING.md` | Parts and consumables — steel stock, hardware, paint, broken out by variant |
| `AGENTS.md` | This file |

## Out-of-scope for this project

- No service code, no APIs, no deployments. Don't reach for builder-mcp,
  Apollo, pipelines, or AWS tools — none of that applies.
- No CRs to file. The deliverable is a buildable physical design.

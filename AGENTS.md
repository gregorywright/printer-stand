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
- Flange plates are **1.5"W × 6"H tall narrow columns** aligned with leg
  width — *not* 3"×3" squares. This was an explicit owner-driven choice
  for aesthetics (no Y-axis protrusion) and gives ~2× the moment
  resistance of a 3"×3" 4-bolt pattern for shelf loads.
- Bolts thread **directly into tapped plate A** — no separate nuts, no need
  to access back side. Bolt tip stops inside plate A.
- Cable X on back chosen over tube diagonal — aesthetic + lighter; tube
  remains an option.
- Tube diagonals on end frames chosen over cables — A1 bedslinger loads
  the end-frame plane heavily, cables would be marginal there.
- End-frame diagonal in the **lower bay** (not upper). Geometry currently
  ~42.6° (not strict 45°) — driven by useful shelf heights, not pure angle.
- H_MIDDLE = 23.75" gives 10" upper-bay clearance and 17.25" lower-bay
  clearance (fits 8" filament spools standing up).
- Knee braces **kept** — welded between plate B's lower extension and the
  underside of the stretcher tube, so they travel with the stretcher
  assembly and preserve knockdown.
- Flange-plate joints chosen over tube-in-tube sleeves — easier for a
  beginner welder, more forgiving on cut accuracy.
- Levelers chosen over casters — rigidity priority. Caster conversion path
  is preserved (chop legs, weld plates).
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
| `printer_stand.scad` | OpenSCAD 3D model — open in OpenSCAD to visualize |
| `SPECS.md` | Hard requirements and dimensions |
| `DESIGN.md` | Design rationale and decisions |
| `AGENTS.md` | This file |

## Out-of-scope for this project

- No service code, no APIs, no deployments. Don't reach for builder-mcp,
  Apollo, pipelines, or AWS tools — none of that applies.
- No CRs to file. The deliverable is a buildable physical design.

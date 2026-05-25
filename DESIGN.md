# 3D Printer Stand — Design

This file captures *why* the design looks the way it does. Hard numbers are in
`SPECS.md`. If you change something here, also update `SPECS.md` to match.

## Architecture

**Two welded end frames + six bolted long stretchers + cable X on back.**

This is the standard knockdown approach for welded steel furniture. It gives
you:

- Rigidity close to a fully-welded design (when bolts are torqued)
- Disassembly into pieces that fit through a 28" doorway
- A small number of bolted joints (6) — annoying once, never again
- Most welds happen on the end frames in flat orientation, friendly to a
  flux-core welder

Alternatives considered and rejected:
- **Single fully-welded frame.** Won't fit through the doorway.
- **Four corner posts that all bolt together.** More joints, harder to keep
  square, less rigid for the same hardware count.
- **Tube-in-tube knockdown joints.** Cleaner-looking but requires precise
  cuts; bad first welding project.

## Why these member sizes

**1.5"×1.5"×0.120" wall tube** is the main structural section.

- Strength-wise overbuilt — peak bending stress at ~5% of yield. We could go
  to 0.083" (14 ga) wall and still pass. We don't, because:
- **0.120" wall forgives a flux-core beginner.** Burn-through margin matters
  more than weight savings on the user's first welding project. Worth ~30 lb.
- Aesthetically, 1.5" tube is in the right scale range for a 48"-long piece
  of furniture; 1" reads spindly, 2" reads industrial-machinery.

**Asymmetric flange plates: 3/8" tapped (plate A) + 3/16" clearance (plate B).**
Plate A on the leg gets the threads — bolt threads engage directly, no
separate nut needed (and no need to access the back side of the plate, which
is welded to the leg). Plate B on the stretcher end is just transferring
compression from the bolt head; 3/16" is plenty for that role. The asymmetry
gives a much stiffer joint than two equal-thickness plates of the same total
mass would.

## Bracing strategy

The stand uses **four bracing elements**, sized to where loads actually go:

1. **Internal diagonal in each end frame** (welded tube). The end frames
   are the high-stress planes — this is where the A1's bed-slinging
   (front-back motion) tries to rack the stand. Tube is the right answer:
   stiff per pound, no maintenance, no pre-tension.
2. **Cable X across the back** (1/8" stainless, turnbuckles). The back
   sees the lowest racking load — zero from the A1, modest from H2D/X1.
   Cables are sufficient and look cleaner than a tube X. They're also
   the hybrid material moment — tube where it's working hardest, cable
   where it's mostly insurance.
3. **Top knee braces (4)** at the front and rear top corners. These resist
   the printer's reaction force at the very top of the stand, where flex
   shows up as visible wobble.
4. **Welded rectangular corners** on the end frames act like rigid moment
   connections — almost as stiff as a triangle in their own plane.

The **front face is intentionally unbraced** — the printer lives there.
Open ends and open back (apart from the cable X) are intentional for cable
routing and visual openness.

### Why X (not single diagonal) for cables

A cable can only pull, not push. If you put a single cable on a diagonal,
it resists racking in one direction and goes slack the other way — frame
flops. Two crossed cables guarantee that whichever way the frame tries to
rack, *one* cable is in tension. Always.

## Knockdown joints

Each long stretcher has a **1.5"-wide × {7.5" or 5"}** plate B welded
perimeter-fillet to its open tube end. Each end-frame leg has matching plate
A's welded to its inner X face at the three shelf heights. **2× 3/8"-16 bolts
per joint**, threading directly into the tapped plate A (no separate nuts).

### Plate orientation: tall narrow column, aligned with leg face

The plates are **1.5" wide** (matching leg width). They do *not* protrude in
the Y (front-back) direction — plate edges flush with the leg's front and
back faces.

Why this geometry over a square plate (e.g. 3"×3"):

- **No Y-protrusion.** Aesthetic win — joint reads as a continuation of the
  leg rather than a flange sticking out into the airspace.
- **Better moment resistance for shelf loads.** A vertical 2-bolt column
  resists the stretcher's tendency to droop at its far end via tension in
  the upper bolt and compression in the lower bolt, with a 3.5" lever arm
  between them. A square 3"×3" 4-bolt pattern only has a 2.4" lever arm.
- **Accepts the loss of yaw resistance** (twisting the stretcher around its
  long axis) — that load case doesn't exist for this stand.

### Plate height differs by stretcher position

- **Top stretchers: 7.5" tall.** This stretcher carries the most: stretcher
  tube enters at top of plate, 2 bolts below the tube, and a knee brace
  below the bolts. The plate has to be tall enough to fit all three with
  socket-wrench clearance between the lower bolt and the brace (~1.5").
  The plate's top edge is flush with the leg top (35.25") so it doesn't
  protrude above.
- **Middle and bottom stretchers: 5" tall.** No knee brace, just tube +
  2 bolts straddling. Plate is centered on the stretcher centerline.
  Bolts at ±1.75" from stretcher centerline (clearing the tube), 0.75"
  margin to plate edge.

This was the resolution to two problems the user spotted:
1. The previous 6" plate had 4 bolts in a column, but 2 of them collided
   with the stretcher tube's intersection of the plate.
2. The lower bolt on the top stretcher had no socket-wrench clearance to
   the knee brace.

Going to **2 bolts** instead of 4 was the bigger insight: 4 bolts was
overbuilt by ~50× for the loads this stand sees. 2 bolts cuts the tap
work in half, halves the bolt count, and resolves the tube-collision
without needing extra plate height for middle/bottom stretchers.

### Bolts thread directly into plate A

Plate A is **3/8" thick** with 3/8"-16 *tapped* holes — six threads of
engagement, plenty stiff and strong. Plate B is 3/16" thick with *clearance*
holes (~7/16"). Bolt enters from the stand interior, passes through plate B,
threads into plate A. **Bolt tip stops inside plate A — never enters the
leg.** No nut on the back side; nothing to access there.

Tools needed: drill press, 5/16" tap drill, 3/8"-16 tap (~$10 from a hardware
store). About 5 minutes of tap work per plate A.

### Don't tap through the leg wall — drill a relief hole instead

After plate A is welded to the leg, a tempting shortcut is to tap through
both the plate AND the leg wall behind it. **Don't.**

- Leg wall is 0.120" — only ~30% of one bolt diameter. Useless thread
  engagement; can't carry meaningful load if plate A's threads ever back off.
- Tapping through both layers (3/8" plate + 0.120" wall) risks cross-threading
  or burr formation as the tap transitions between materials of different
  hardness.
- Plate A's existing thread engagement already exceeds bolt strength.
  Adding unreliable wall threads contributes nothing.

Instead, **drill a 1/2" clearance hole through the leg back wall** behind
each tapped plate-A hole. The bolt tip pokes into the leg cavity through
the relief hole if it happens to be 1/32" longer than calculated. Five
seconds of drilling per hole.

### Why flange plates and not tube-in-tube sleeves

Flange plates are forgiving:
- Cuts don't have to be precise — flat plates align themselves
- Bolts pull plates flat against each other; small misalignments disappear
- Visible joint = easy to inspect tightness
- All welds are simple fillet welds on plate-to-tube — friendly to a flux-core
  beginner

Internal sleeves are cleaner-looking but require very tight tolerances on
tube ID and sleeve OD.

## Knee braces

The top corner of each long-stretcher joint has a small tube knee brace
welded as part of the stretcher assembly:

- **Outboard end** mitered at the brace's slope angle so the cut face is
  vertical, sitting flush against plate B's stand-interior face (well below
  the bolts)
- **Inboard end** mitered at (90° − slope) so the cut face is horizontal,
  sitting flush against the underside of the stretcher tube (~5" inboard
  from the joint)
- Brace is part of the stretcher assembly — bolts on as one unit, knockdown
  property preserved

The braces are borderline structurally necessary given the tall-plate moment
resistance, but they're a clean structural detail that visually reinforces
the joint corner. From the side view, you see a small triangle in the
upper-corner area: stretcher on top, plate B's lower extension on the
outside, brace closing the triangle.

This was the resolution to the "knee brace can't connect to the leg without
breaking knockdown" problem — by extending plate B downward beyond the
stretcher, we get a weld surface that travels with the stretcher.

## Plywood shelf support

Plywood shelves drop onto **3/4"×3/4"×1/8" angle iron ledgers** welded along
the inboard top edge of the front and back long stretchers (bottom and
middle shelf levels only).

- Vertical leg of the angle is welded to the inboard side wall of the
  stretcher tube. Horizontal leg extends inward.
- Top of horizontal leg is **flush with the top of the stretcher tube**, so
  the plywood top sits flush with the steel tube top.
- Plywood is sized 40.875" × 17.25" × 3/4" — 1/16" clearance per side
  in X (between end-frame inner faces), and bridges Y from the inner edge
  of the front angle to the inner edge of the back angle.
- **No angle on the end-frame cross-tubes.** 3/4" plywood spans 17.25"
  with no center support without meaningful sag, even under filament-spool
  loading. The end-frame tubes just bound the rectangle.
- **No fasteners required** — gravity holds the plywood down. Optional:
  a screw at each plywood corner into a pre-drilled hole in the angle, if
  shelves rattle.

Knockdown is preserved: angle ledgers are welded to the long stretchers,
so they travel with the stretcher when bolted on. Plywood lifts out for
disassembly.

## Wood top mounting

Solid hardwood at this depth moves ~1/4" across grain seasonally (summer
humid → winter dry). Grain runs the 48" direction, so movement is in the Y
(25.75") direction.

**Anchor at front-center, float everywhere else.**

- One screw + washer through a normal-sized hole at the front-center attaches
  the top firmly. Wood expands and contracts symmetrically front and rear
  from this anchor.
- All other attachments use **slotted holes** in the steel top stretchers
  (slots oriented Y, ~3/8" long) with **fender washer + pan-head machine
  screw** going up through the slot into a **threaded insert** in the wood.
- The fender washer holds the wood down; the slot lets the screw migrate as
  the wood breathes.
- Threaded inserts (E-Z Lok or similar, 3/8"-16) let the top come off cleanly
  for refinishing.

## Height adjustment

Two independent mechanisms, deliberately decoupled:

| Adjustment | Mechanism | Range |
|---|---|---|
| Floor flatness | Leveler studs at each leg | ~1" |
| Counter-height match | Shims between steel top and wood underside | ±1/4" |

This means: build the steel frame to *counter-height − minimum-wood-thickness − 1/4"*,
then shim the wood up to exact counter-height. Floor flatness handled separately
at the levelers. Re-shimming for seasonal wood movement (or a refinish, or a
move) doesn't require touching the levelers.

## Levelers

- **1/2"-13 stud, 2" swivel base.** Studs sized for stiffness, not load — load
  is fine at 3/8". Bigger stud = less wobble in the threads.
- **Swivel base is the key feature.** A fixed base puts a bending moment in
  the stud when the floor isn't perfectly flat; a swivel base keeps the stud
  in pure axial compression regardless of foot tilt.
- **Weld-in threaded insert** in the bottom of each leg. Closes the open tube
  end and provides ~3/4" of thread engagement (1.5× stud diameter — the
  sweet spot).
- **Felt or rubber pads** on the leveler bases for tile-floor friction and
  protection.

## Visual / aesthetic decisions

- **Mitered corners on end frames** (45° cuts where horizontal meets vertical)
  read more "designed" than butted joints. Slightly more work to fit, worth it.
- **Plug open tube ends** with steel caps or plastic plugs — open tube ends
  look unfinished.
- **Matte black powder coat or paint.** Hides flux-core weld imperfections,
  pairs with warm wood top.
- **Mixed material language:** tube on the high-stress plane (end frames),
  cable on the low-stress plane (back). Reads as deliberate rather than
  industrial-leftover.
- **End-frame diagonals can mirror or match.** Mirrored = symmetric front
  view, more "furniture." Matched = directional, more "industrial cart."
  Owner's call.

## Shelf heights

| Shelf | Top-of-tube Z | Clear above |
|---|---|---|
| Bottom | 5" | 17.25" (fits 8" filament spools standing up + margin) |
| Middle | 23.75" | 10" (small printers/accessories — printers actually live on top) |
| Top frame | 35.25" | (1.75" of wood top) |

The 17.25" clear space on the bottom shelf was driven by the 8"-diameter
filament spool standing-up requirement. The 10" upper-bay clearance was an
explicit choice to keep the middle shelf usefully accessible (filament,
small parts, tools) while leaving a square-ish lower bay for the diagonal.

The lower-bay diagonal at this geometry runs at ~42.6° from horizontal —
close enough to 45° that the eye can't tell the difference, but the shelf
heights remain useful rather than driven by a strict 45° geometry.

## Future modifications anticipated

- **Casters in the future.** If owner repurposes the stand later: chop ~3"
  off each leg, weld a 3"×3"×1/4" plate on, bolt 4-bolt caster plates in.
  Clean conversion path.
- **Single back tube diagonal** instead of cable X. Simple swap — replace
  cable hardware with a flange-plated tube diagonal. Stiffer, more bold,
  loses the cable aesthetic. Visualization model is structured to make this
  swap easy.

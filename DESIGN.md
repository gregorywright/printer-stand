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

**3/16" plate for flanges** (not 1/4"). 1/4" was overkill — the plates see
maybe 100–200 lb of bolt tension at worst-case racking, and 3/16" doesn't
oil-can. 1/8" was rejected as too floppy.

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

Each long stretcher has a 3"×3"×3/16" flange plate welded perimeter-fillet
on each end. Each end-frame leg has matching plates welded to its inner
face at the three shelf heights (bottom, middle, top). 4× 3/8"-16 bolts per
joint.

### Why flange plates and not tube-in-tube sleeves

Flange plates are forgiving:
- Cuts don't have to be precise — flat plates align themselves
- Bolts pull plates flat against each other; small misalignments disappear
- Visible joint = easy to inspect tightness
- All welds are simple fillet welds on plate-to-tube — friendly to a flux-core
  beginner

Internal sleeves are cleaner-looking but require very tight tolerances on
tube ID and sleeve OD.

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

## Future modifications anticipated

- **Casters in the future.** If owner repurposes the stand later: chop ~3"
  off each leg, weld a 3"×3"×1/4" plate on, bolt 4-bolt caster plates in.
  Clean conversion path.
- **Single back tube diagonal** instead of cable X. Simple swap — replace
  cable hardware with a flange-plated tube diagonal. Stiffer, more bold,
  loses the cable aesthetic. Visualization model is structured to make this
  swap easy.

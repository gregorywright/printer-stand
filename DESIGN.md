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

The stand uses **three bracing elements**, sized to where loads actually go:

1. **Internal diagonal in each end frame** (welded tube). The end frames
   are the high-stress planes — this is where the A1's bed-slinging
   (front-back motion) tries to rack the stand. Tube is the right answer:
   stiff per pound, no maintenance, no pre-tension.
2. **Cable X across the back** (1/8" stainless, turnbuckles). The back
   sees the lowest racking load — zero from the A1, modest from H2D/X1.
   Cables are sufficient and look cleaner than a tube X. They're also
   the hybrid material moment — tube where it's working hardest, cable
   where it's mostly insurance.

   **Alternative variant being considered: Z-tube back panel.** Two welded
   tube diagonals in a Z pattern (one in the lower bay, one in the upper)
   instead of cables. The three back-stretchers + two diagonals are
   pre-welded as a single "back panel" that bolts to the legs through
   the existing six plate-pair joints. Lower-bay diagonal at ~24°
   (shallow but in the panel plane), upper-bay diagonal mirrored. Captured
   in `printer_stand_zback.scad`. Trade-offs: more material/weight
   (~+8 lb), more dramatic look (visible structural diagonals from behind),
   no pre-tensioning maintenance, no cable hardware. Owner is comparing
   visually before picking.
3. **Welded rectangular corners** on the end frames act like rigid moment
   connections — almost as stiff as a triangle in their own plane.

(Top knee braces were considered and rejected. Structurally they did
almost nothing given the welded rectangular corners + end-frame diagonals
+ cable X + 2-bolt joint moment resistance. The 1.5" lever arm between
top-joint bolts already gives ~50:1 safety margin against worst-case
front-to-back rocking — the brace's marginal stiffness contribution
isn't worth the extra welds, mitered cuts, or the visual clutter at the
top corners.)

The **front face is intentionally unbraced** — the printer lives there.
Open ends and open back (apart from the cable X) are intentional for cable
routing and visual openness.

### Why X (not single diagonal) for cables

A cable can only pull, not push. If you put a single cable on a diagonal,
it resists racking in one direction and goes slack the other way — frame
flops. Two crossed cables guarantee that whichever way the frame tries to
rack, *one* cable is in tension. Always.

### Back bracing decision: build open, brace only if needed

After working the numbers, the back brace was downgraded from "required" to
"deferred insurance":

- The back is the **low-racking-load plane** — the A1 bedslinger loads the
  *end-frame* plane, not the back. And the bedslinger's peak inertial force
  is only **~3 lbf** (≈1 kg moving bed × ~1 g). Force magnitude is a
  non-issue; the only real risk is resonance, and that's conditional on the
  open-back sway mode (rough SDOF estimate ~15–22 Hz) actually landing in
  the printer's excitation band.
- The stand is **~185 lb of steel** carrying a moving bed that's **<1% of
  system mass**, so a moment frame (welded/bolted rectangles, no diagonal)
  very likely suffices on the back — the same reason a big-tube desk is
  rock-solid with no diagonals at all.

**Plan:** build with an **OPEN back** — no cable X, no Z-tube. Keep the
end-frame diagonals (owner wants the 45° practice, and they brace the plane
the bedslinger actually hits). After assembly, do a **tap test**: nudge the
top sideways and read the ring-down with a phone accelerometer app. If the
open-back sway mode is comfortably above ~25 Hz and damps out in a cycle or
two, leave the back open. If it visibly wobbles in use, add the cable X for
that "wire X-wing" look.

**Critical sequencing — weld the anchors now, defer only the cables.** Weld
the 4 cable anchors onto the rear corner legs *during initial fabrication,
before paint/powder,* even though the cables aren't installed. Welding
anchors onto a finished frame later means grinding back the coating and
re-finishing in place; welding them now is free. With anchors pre-welded,
adding the X-wing later is a hand-tools-only job: hook swaged/mechanical
cable eyes to the anchors through 2 turnbuckles + 2 shackles, then tension.

**Anchor design.** The load is trivial (~10–30 lb functional pretension,
~140 lb worst-case shove, vs. the 1/8" cable's ~1,700 lb break and a welded
tab good for thousands), so size the anchor for looks and weldability, not
strength. **No swivel needed** — the shackle articulates to the cable's
diagonal. Either:

- a small mild-steel tab **edge-welded so the hole stands proud of the
  tube** — a hole drilled in a tab laid flat against the tube is blocked by
  the tube, so the tab must project off the face; or
- a bought **weld-on pad eye / D-ring** (grind off any zinc plating before
  flux-core welding).

Hole sized for a ~1/4" shackle pin.

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

### Plate height: 5" everywhere

All 12 plates are identical: **1.5" wide × 5" tall**.

- **Top stretchers:** plate top flush with leg top (35.8125"). Tube enters
  the plate at the top (top 1.5"). Both bolts sit *below* the tube —
  0.75" below tube bottom, then 1.5" further below.
- **Middle and bottom stretchers:** plate centered on stretcher centerline.
  Tube enters mid-plate. One bolt above the tube, one below, at ±1.75"
  from stretcher centerline, 0.75" margin to plate edges.

Earlier iterations had the top plate at 7.5" tall to accommodate a knee
brace below the bolts, but the brace was dropped (see "Bracing strategy"
above). With no brace, the top plate doesn't need extra height.

Going to **2 bolts per joint** instead of 4 was an important simplification:
4 bolts was overbuilt by ~50× for the loads this stand sees. 2 bolts cuts
the tap work in half, halves the bolt count, and resolves the bolt-tube
collision that 4-bolts-in-a-column would have had on middle/bottom plates.

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

## Plywood shelf support

Plywood shelves drop onto **3/4"×3/4"×1/8" angle iron ledgers** welded along
the inboard top edge of the front and back long stretchers (bottom and
middle shelf levels only).

- Vertical leg of the angle is welded to the inboard side wall of the
  stretcher tube; the horizontal leg extends inward and carries the plywood.
- Top of the horizontal leg is **inset DOWN by the plywood thickness
  (~23/32" for nominal 3/4" ply)**, so the plywood drops into the recess and
  its TOP finishes flush with the steel tube top.
- Plywood is sized 40.875" × 17.25" × 3/4" — 1/16" clearance per side
  in X (between end-frame inner faces), and bridges Y from the inner edge
  of the front angle to the inner edge of the back angle.
- **No angle on the end-frame cross-tubes.** 3/4" plywood spans 17.25"
  with no center support without meaningful sag, even under filament-spool
  loading. The end-frame tubes just bound the rectangle.
- **Screwed down, not gravity-held.** Plywood is dimensionally stable (it
  doesn't move seasonally like the solid top), so no slots are needed: drill
  clearance holes in the horizontal leg every ~6" and run wood screws up into
  the plywood underside.

Knockdown is preserved: angle ledgers are welded to the long stretchers,
so they travel with the stretcher when bolted on. Back the screws out and
the plywood lifts out for disassembly.

## Wood top mounting

The solid top moves cross-grain — across the 25.75" depth (Y), since the
grain runs the 48" length. How much depends on species and the seasonal
indoor moisture swing (ΔMC, in percentage points):

    movement = 25.75" × C_T × ΔMC

Seattle's mild, humid, year-round-stable indoor climate gives a SMALL swing
(~ΔMC 3–4: heated-dry winter ~8% → humid summer ~11–12%). Flat-sawn,
worst case:

| Species    | C_T     | Full-width move @ ΔMC 4 |
|------------|---------|-------------------------|
| Red oak    | 0.00369 | ~0.38"                  |
| Hard maple | 0.00353 | ~0.36"                  |
| Poplar     | 0.00289 | ~0.30"                  |

So ~1/4"–3/8" full-width in Seattle (a continental climate at ΔMC 6 would
exceed 1/2"). Quartersawn stock roughly halves it.

**Anchor at front-center, float toward the back.**

- One screw + washer through a NORMAL round hole at the front-center fixes
  the top. Because the steel only supports the perimeter (front + back top
  stretchers), the top can't be pinned mid-depth — so it grows/shrinks from
  the front anchor *toward the back*, and the back clips carry essentially
  the full cross-grain movement (it is NOT symmetric front/rear).
- All other clips use **Y-slotted holes** with a **fender washer + pan-head
  machine screw** going up through the slot into a **threaded insert** in the
  wood.
- Slot length: size for the movement across the ~20.25" stretcher span. At
  ΔMC 4 (oak) that span moves ~0.30"; fitting the top at mid-season MC means
  each back screw only needs ±~0.15" of travel. The SCAD model uses a
  ~15/16"-long slot (7/16" hole + 0.5" travel ≈ ±0.28" of screw travel) —
  about 2× margin for Seattle and forgiving of build-MC error. Minimum useful
  length is ~3/4"; a 3/8" slot gives almost no travel and would crack the top.
- The fender washer (1" OD) holds the wood down wherever the screw sits; the
  slot lets the screw migrate as the wood breathes.
- Threaded inserts (E-Z Lok or similar, 3/8"-16) let the top come off cleanly
  for refinishing. ACCLIMATE the wood to the room before final fitting.

## Height adjustment

Three mechanisms, deliberately decoupled, in order of who does the heavy lifting:

| Adjustment | Mechanism | Range |
|---|---|---|
| Build-height error | Cut legs to final length at assembly (trim bottoms) | unlimited (down) |
| Floor slope + fine counter-match | Leveler feet (42–72mm range) | ~±0.34" usable with the 1/2" slope centered |
| Counter-height match (fine) | Shims between steel top and wood underside | ±1/4" |

**Legs are the primary height control, and the most forgiving — a first-time
welder's safety net.** Cut the legs deliberately *long*, dry-assemble the
frame, measure against the actual counter, then trim the leg *bottoms* to
final length. Every flange plate sits at or above H_BOTTOM (5"), well above
the trim zone, so trimming the bottom touches no joint. This means a frame
that comes out too tall is fixed with the chop saw, not lived with.

The leveler nominal lift is set to 2.0" (floor → cap underside), chosen to
center the counter-end/far-end foot pair for the ~1/2" sloped install floor —
NOT the range middle — so the feet absorb build error both ways (see "Floor
leveling" below). Shims at the wood-to-steel interface make the final fine
counter-match (±1/4") and let you re-tune for seasonal wood movement, a
refinish, or a move without touching the legs or feet.

**Caveat (rigidity):** don't lean on a lot of leveler stud extension to fix a
short frame — a long extended stud is a cantilever that reintroduces the wobble
the design works to avoid. Big errors get corrected at the legs; the feet are
for fine adjustment only.

**Floor leveling (portable stand — feet only).** This is a knockdown stand
that gets moved between locations, so floor slope is handled ENTIRELY by the
adjustable feet, and the **end-frames are built identical (all four legs the
same length)**. NEVER trim legs to a specific floor's slope — it would be wrong
at the next location and would force two different end-frames.

The measured foot range (floor → cap underside) is **42–72mm (1.65–2.83")**.
At the initial location the floor slopes down *away from the counter*, so the
far end's feet must sit ~1/2" higher than the counter end's — a *fixed offset*,
not a ±split. That offset is the binding constraint: center the near/far foot
*pair* in the range, which puts the **counter-end foot at ~2.0" nominal** and
the far-end foot at ~2.5". That leaves **~±0.34" of build-error slack** either
direction (too tall or too short) while still fitting the 1/2" slope under the
72mm max. (Centering a single foot at the 2.25" range middle would look
symmetric but leaves only ~0.09" before the far foot tops out — the wrong
target, since the slope isn't centered.) No rigidity penalty anywhere in this
range: even fully extended the M12 rod is far from buckling/wobble. Re-level at
each new location; re-check the front-back (25.75") axis too.

## Levelers

- **M12×1.75 stud, 2" swivel base.** Studs sized for stiffness, not load —
  load is fine even at M10/3/8". The fatter M12 (≈ metric 1/2") = less wobble
  in the threads. Metric was chosen because affordable swivel feet on the
  market are nearly all metric; M12 preserves the 1/2"-equivalent stiffness.
- **Swivel base is the key feature.** A fixed base puts a bending moment in
  the stud when the floor isn't perfectly flat; a swivel base keeps the stud
  in pure axial compression regardless of foot tilt. The chosen foot also has
  a **rubber/nylon base**, so it doubles as the tile-protection / anti-creep
  pad — no separate felt pads needed.
- **Tapped foot-cap plate** welded onto the bottom of each leg (a 1.5"×1.5"
  ×3/8" steel cap), tapped M12×1.75. ~5 threads of engagement — the foot is in
  compression, so that's far more than enough. (Chosen over a bought weld-in
  insert: pre-threaded weld-in feet that fit 1.5" square tube are scarce and
  ~$16 each; a tapped cap reuses a cheap M12 tap.)
- **Nominal lift 2.0"** (floor → cap underside; the cap stacks above this).
  The measured foot adjusts 42–72mm (1.65–2.83"). 2.0" is chosen to center the
  counter-end/far-end foot *pair* given the 1/2" floor slope (see "Floor
  leveling" above), giving ~±0.34" of build-error slack either way. Coarse
  height error is still taken out at the legs (cut long, trim); the feet handle
  the slope + fine counter-match.

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
- **End-frame diagonals are matched, not mirrored.** Both run back-top →
  front-bottom (same orientation in each end frame) — a directional,
  more "industrial cart" look. Chosen alongside the single-miter 45°
  detail below for build simplicity (identical cuts, identical layout
  on both end frames).

## Shelf heights

| Shelf | Top-of-tube Z | Clear above |
|---|---|---|
| Bottom | 5" | 17.25" (fits 8" filament spools standing up + margin) |
| Middle | 23.75" | 10" (small printers/accessories — printers actually live on top) |
| Top frame | 35.8125" | (1-3/16" of wood top) |

The 17.25" clear space on the bottom shelf was driven by the 8"-diameter
filament spool standing-up requirement. The 10" upper-bay clearance was an
explicit choice to keep the middle shelf usefully accessible (filament,
small parts, tools) while leaving a square-ish lower bay for the diagonal.

The lower-bay diagonal runs at a **true 45°**. Because the bay is wider
(18.75") than tall (17.25"), a 45° diagonal spans a 17.25" square: it rises
the full bay height but lands on the bottom stretcher ~1.5" short of the
front leg. That small offset is structurally negligible (the diagonal still
triangulates the bay with the same ~50:1 racking margin) and reads as an
intentional detail.

Why a true 45° instead of the earlier corner-to-corner ~42.6°: it's the
only non-90° angle that can be laid out and cut accurately with a speed
square and an angle grinder — no protractor or angle finder needed. Every
diagonal cut is a single 45° miter (one cut per end), and both end frames
use identical cuts. The diagonal starts at the back-top corner (miter
seating on the back leg) and runs down to the front. This was a
first-time-welder simplification: it trades a hard-to-cut compound corner
joint for two easy, identical 45° miters with flat fillet welds.

## Future modifications anticipated

- **Casters in the future.** If owner repurposes the stand later: chop ~3"
  off each leg, weld a 3"×3"×1/4" plate on, bolt 4-bolt caster plates in.
  Clean conversion path.
- **Single back tube diagonal** instead of cable X. Simple swap — replace
  cable hardware with a flange-plated tube diagonal. Stiffer, more bold,
  loses the cable aesthetic. Visualization model is structured to make this
  swap easy.

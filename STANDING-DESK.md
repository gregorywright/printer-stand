# Motorized Standing Desk — Buy-Now Option

This file captures the **off-the-shelf alternative** to building the steel
stand: a motorized (electric height-adjustable) standing desk, bought now as a
stopgap while equipment is arriving — and possibly kept as the permanent
electronics bench.

This is an *exploration / fallback*, not a replacement for the steel design.
It exists because the owner has gear on the way and no surface to put it on, and
because a 48"×30" sit/stand desk happens to land remarkably close to the stand's
footprint and use case.

## Why this is even on the table

The steel stand's locked **37" height** (set by the kitchen-counter match) is
*also* the right surface height for working at a bench from a high stool. So a
standing desk dialed to 37" satisfies the same ergonomic goal — and unlike the
fixed steel build, it can be raised later. See `DESIGN.md` → "Using the stand as
a desk" for the broader sit-at-it analysis; this file is specifically about
**buying a powered desk** instead of (or before) building.

### The counter-seam strategy applies here too

The intended placement butts the desk **against the existing kitchen counter**
to form one continuous work surface (printer/equipment parked at the far end,
operator sitting at the seam where the counter continues). Everything in
`DESIGN.md` about matching the seam applies to a bought desk as well:

- **Height match to ~1/16"**, not just "looks level" — a powered desk makes this
  trivial (nudge the up/down buttons), which is actually an *advantage* over the
  fixed steel build.
- **Edge profile match.** The existing counter is a hard faux-marble (quartz/
  solid-surface-type) top with a **~1/8" roundover** on its front edge. A DIY
  wood top for the desk should get a **matching ~1/8" roundover** so the two
  surfaces read as one and nothing catches crossing the seam. Don't leave the
  desk top dead-square against the counter's rounded edge.
- **Anchor the top's fixed point at the front, let it grow toward the back**, so
  seasonal wood movement never opens/closes the gap at the seam (same rule as
  the steel build).
- **Free bracing:** once butted to the heavy counter, the desk can't lean toward
  the counter — the counter braces it in the fore-aft direction.

## Sizing target

| Dimension | Target | Why |
|---|---|---|
| Width | **48"** | Matches the steel stand's wood-top length; common stock size |
| Depth | **24" or 30"** | 24" matches the stand (25.75"); 30" gives an instrument row at the back + elbow room. 30" preferred if buying fresh |
| Height range | must include **37"** | Counter-seam match. Essentially every electric desk covers this |
| Capacity | ≥ ~150 lb | Scope + NanoVNA + TinySA + PSU + a printer is well under any frame's rating |

48"×30" is the single most common electric-desk size made, so options are
plentiful and cheap.

## Leading candidate: FlexiSpot E7 (standard)

The owner likes the look of the **FlexiSpot E7**. After comparing it to the
E7 Pro, the **standard E7 is the better pick for this use** (not just cheaper):

### E7 vs E7 Pro

| | **E7** | **E7 Pro** |
|---|---|---|
| Foot/leg shape | **T-foot** (leg column centered on the foot) | **C-foot** (column set toward the back of the foot) |
| Height range | ~22.8"–48.4" | ~25"–50.6" |
| Weight capacity | 355 lb | 440 lb |
| Stability | Very good | Stiffer, esp. near full extension |
| Cable mgmt | Tray | Tray + magnetic fabric cover |

**Why the standard E7 wins here:**

- **T-foot suits a counter install better.** The Pro's C-foot pushes the upright
  toward the *back* of the foot to free front shin room — but against a counter,
  with the printer parked at one end, front shin clearance from the frame isn't
  needed, and the rearward foot can fight a flush-to-counter placement.
- **Height:** both clear 37" with huge margin; the E7's lower floor is
  irrelevant since the desk lives near counter height. Not a deciding factor.
- **Capacity:** 355 lb is already overkill for a bench + printer; the Pro's
  440 lb buys nothing here.
- **Stiffest regime is where we live.** Standing desks are stiffest at *low*
  extension; at ~37" the E7 is nowhere near its wobbly tall end. The wobble that
  plagues these desks at 48"+ won't show up at counter height.

> Confirm the **width-adjust range** fits a 48" top (E7 crossbar spans roughly
> 43"–63" between feet — 48" is well inside). Only matters if a *narrower* top
> is ever wanted.

## DIY top mounting + wood movement (important)

**These frames do NOT account for wood movement.** They assume a dimensionally
stable top (MDF, particleboard, plywood, bamboo — what FlexiSpot sells). The
mount is **rigid**:

- Two steel **mounting plates** (atop each leg column) + an **adjustable steel
  crossbar** between them.
- Desktop is screwed down through **round holes** (≈10–11 provided wood screws)
  into the underside of the top. **Holes are round, not slotted** — every screw
  pins the top to the steel in both axes.

A **solid-wood** top ~48" wide pinned by ~10 rigid screws can't expand
cross-grain → it **cups or splits** (same physics as `DESIGN.md`'s wood-movement
section: ~1/4"–3/8" of cross-grain movement across ~25" in Seattle). Three ways
to handle it, easiest first:

1. **Use a stable engineered top** (hardwood-veneered plywood, bamboo, or MDF).
   No appreciable movement → the rigid mount is fine as-is, and it stays dead
   flat. This is what the frame wants. Path of least resistance.
2. **Solid wood + slot the steel.** Keep one front-center screw (or cross-pair)
   as a fixed anchor; **file/drill the remaining plate + crossbar holes into
   slots running in the cross-grain (depth) direction**, add **washers** under
   the screw heads so they slide. ~30 min of work. (Mirrors the float-the-top
   scheme already used on the steel stand.)
3. **Solid wood + wood cleats/battens.** Screw the steel plates rigidly to
   hardwood/ply cleats, then attach the solid top to the cleats with
   **figure-8 fasteners or slotted Z-clips/buttons** that allow cross-grain
   slide. Most robust, removable for refinishing, fully decouples the top from
   FlexiSpot's hole pattern.

## Does the top affect stability? Yes — it's half the structure

Two distinct "stabilities":

1. **Vertical bounce / column flex — frame's job.** Pure leg-column and
   telescoping-joint behavior. The top can't help or hurt it. Dominated by
   extension height → at 37" the E7 is in its stiffest, best regime.
2. **Side-to-side rack / sway — the top is structural.** Two columns + a thin
   crossbar is weak in the racking plane alone; the rigid top screwed across
   **both** feet acts as a **shear diaphragm** tying the leg assemblies together
   (same principle as the stand's welded corners / cable-X). The manufacturer's
   stability assumes a proper top is bolted on.

Implications for the top choice:

- **Stiffer/thicker top = better diaphragm.** A 1" ply or 1‑3/16" solid top is a
  better brace than thin particleboard → the DIY heavy top is a **net stability
  gain** over the stock top.
- **Float vs. diaphragm trade-off:** slotting the holes to protect a solid-wood
  top (option 2) *slightly* relaxes the racking tie in the slotted direction.
  Small in practice (anchor + cross-pair stay fixed; washer friction still
  carries most shear), but real. **The cleat method (option 3) avoids it** —
  cleats bolt rigidly to the steel for full diaphragm action while the wood
  floats above. If going solid wood and stability matters, prefer option 3.
- **Weight** lowers resonance / adds damping (minor bonus). **Overhang** past
  the feet isn't tied down — don't perch full weight on a far unsupported
  corner (2" all-around is fine).

## Top upgrade path (buy cheap, upgrade later)

The top is **fully decoupled from the frame** — just screwed to the mounting
plates + crossbar. Swapping it later is a ~20-min job: flip the desk, back out
the ~10 screws, lift the old top, drill pilots in the new one, screw it down.
The frame doesn't care what's on top. So **buy the cheapest stock top now**;
upgrade only if the wobble test (below) or the look calls for it. Zero penalty
for deferring.

**Sequence: do the wobble test at 37" FIRST.** When the cheap-top desk arrives,
butt it to the counter and push the top sideways at counter height — watch it
rack. 37" is the E7's *stiffest* regime and the counter braces the fore-aft
axis, so it'll very likely be rock-solid as-is. If so, a heavier top becomes a
**look/seam-matching** decision, not a stability fix — don't spend the effort
chasing stability you already have.

**Preferred upgrade top: two 3/4" plywood sheets laminated (≈1.5" total) +
edge-banding.** Better than the stock top for this use:

- **Stiffer + heavier → a *better* diaphragm**, so it raises racking stiffness
  rather than lowering it (see the stability section above).
- **Plywood doesn't move seasonally**, so it screws straight down through the
  frame's rigid round holes — **no slotting, no cleats, no figure-8 clips.** The
  whole wood-movement headache (options 2/3 above) simply doesn't apply; that
  only bites with *solid lumber*.
- **Edge-banding** (iron-on veneer or a glued hardwood strip) finishes the
  laminated edge and carries the **matching ~1/8" front-edge roundover** for the
  counter seam. A ~1.5" edge also reads more like furniture and gets closer to
  the counter's thickness.

Watch-outs for the laminated top:

- **Glue the full face and clamp the whole field** (roll glue across the entire
  mating face; weight/clamp everywhere). Edge-only glue buzzes and delaminates.
- **Screw length vs. thickness.** Stock screws are sized for a ~1" top; into
  1.5" of ply they bite fine (more bite = better). If a hardwood layer is ever
  added, confirm screws can't punch through the surface.
- **Weight ≈ 55–70 lb** for 48"×30"×1.5" ply — far under the 355 lb rating and
  the lift motors won't notice, but get a hand when flipping the desk to swap.
- **A single 3/4" sheet may be enough.** Screwed solid across both feet it's
  already a rigid diaphragm at 48"×30" and stiffer than stock. The double
  lamination is mostly look/heft/seam-thickness — if the single sheet feels
  solid, stop there.

## Bottom line / recommendation

- **Buy the standard FlexiSpot E7, 48"×30"** (or 48"×24" to match the stand's
  depth exactly). The Pro's upgrades don't help this use; the T-foot is friendlier
  to a counter install.
- For the top: **veneered ply/bamboo** = zero movement worry + max stiffness +
  least work. If a **solid-wood** top is wanted, use **option 3 (cleats +
  figure-8 / Z-clips)** so the wood-movement fix doesn't cost diaphragm stiffness.
- **Sleeper benefit of buying first:** living with a 48"×30" powered desk for a
  few weeks will tell the owner exactly what **depth, height, and center
  clearance** he actually wants *before cutting any steel* on the real bench —
  and the powered height match to the counter is genuinely nicer than the fixed
  build for the seam.

## Relationship to the steel build

Buying a desk does **not** kill the steel-stand project — it de-risks it. The
desk is a stopgap that also serves as a full-scale ergonomics mockup. If the
steel stand still gets built, the desk can move to another room or become a
dedicated standing workstation. See `DESIGN.md` → "Using the stand as a desk"
for how the steel design itself would change to be sat at (off-center knee hole).

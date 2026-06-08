# Fabrication & Build Notes

How to actually build the stand — jigs, weld sequence, distortion control, and
build order. Dimensions live in `SPECS.md`; rationale in `DESIGN.md`; tools in
`TOOLS.md`. This is the bench doc.

Context: first-time flux-core welder, woodworker, **no metal welding/assembly
table**. The end-frames must come out **square, flat, and identical to each
other**.

---

## Guiding principles (read first)

1. **Flatness beats fancy jigging.** The #1 failure is a *twisted* end-frame.
   A dead-flat reference surface under the assembly prevents that — more
   important than how elaborate the jig is.
2. **Tack everything first, then weld.** Tacks (not clamps) hold the assembly
   against weld shrinkage. Tack all joints, check square/flat, *then* weld out.
3. **You cannot out-clamp weld shrinkage** — it's near yield-level force (see
   "Clamp force" below). Control distortion with **sequence**, not muscle.
4. **Build both end-frames in the same setup** (or use the finished first one
   as the template for the second) → identical for free.
5. **Cut legs LONG, trim at assembly.** Final height is dialed in on the actual
   (sloped) floor — see `DESIGN.md` "Height adjustment".

---

## The flat reference surface

You don't need a steel welding table. Options, best-fit first:

- **Flat wood base** (woodworker-friendly): a sheet of **¾" MDF** (flatter and
  cheaper than plywood) or a quick **torsion box**, ~28" × 40" — bigger than the
  ~21.75" × 33.4" end-frame. Verify flat with a straightedge; keep it supported
  flat. Humidity can move MDF over time, so build the frames in one session.
- **Garage concrete floor** — flat, free, fireproof. Chalk-line the layout; use
  bricks/blocks/magnets as stops. Downside: working on your knees.
- **A flat bench / two flat sawhorses + a stiff sheet.**

---

## End-frame jig (wooden)

A flat base + wooden **stops** that recreate the frame outline, plus the
**magnetic welding squares you already own** for the corner angles.

**Layout:**
- **Square corner reference:** two hardwood fences forming an accurate 90° "L".
  Set square with the **diagonal method** (adjust until the rectangle's two
  corner-to-corner diagonals are *equal* — far more accurate than a combo square
  over 33").
- **Leg fences:** straight strips the two legs butt against, at correct spacing
  and parallel.
- **Cross-tube locators:** stop blocks at the bottom/middle/top heights.
- **Diagonal locators:** a block or two holding the 45° diagonal's mitered ends.

**Critical rule — keep wood ~1½–2" back from every joint.** Locate the *edges*
of the tubes; leave the corners themselves open air. That way you can weld the
top face + both side faces of each joint; only the face on the jig is blocked
(you get it by flipping — see below). Reference the tubes' *outer faces* against
the fences (matches the frame's outer dimensions).

**Magnetic squares** sit at the open corners to hold 90° — and they're steel, so
heat and spatter don't bother them. Let wood set *position*, magnets set *angle*.

---

## Weld access & the flip

With the frame lying flat and joints left open, each joint welds on **3 of 4
faces** (top + two sides). The 4th face is against the jig.

1. Tack and weld the 3 accessible faces.
2. **Flip the whole frame** and weld the undersides. By then it's a rigid tacked
   unit, so the flip side only needs a *flat* surface, not the full jig.

(Given how overbuilt the frame is, 3 faces per joint is already far more than the
loads need — but flipping for full-perimeter welds is cheap and clean.)

---

## Weld sequence (minimize twist)

Tack-all → lock the diagonal → balanced skip-welds → flip → repeat → cool before
unclamping.

1. **Tack the 6 leg/horizontal joints** (one small tack each, top face). Check
   diagonals equal (square) + flat; adjust.
2. **Tack the diagonal's two ends** — this *locks* square and holds it through
   the rest of welding. Re-check.
3. **Second tack** on a side face of each joint → rigid enough to flip.
4. **Full weld-out, alternating to cancel pulls** (short stitch beads, cool
   between):
   - middle-left, then middle-right (center first, balanced L/R)
   - top-right, then bottom-left (one diagonal pair)
   - top-left, then bottom-right (the other pair)
   - alternate inside/outside side-faces of each joint so it can't fold one way
   - **full-weld the diagonal near the end** (tacked early to hold square, welded
     out late so its lengthwise shrinkage doesn't pull the rectangle).
5. **Flip; weld the undersides** in the same balanced order.
6. **Cool fully before unclamping.** Re-check square + flat.

One continuous bead per side is the classic way to banana a frame — don't.

---

## Clamp force — what the clamps actually fight

You **cannot** restrain weld distortion by clamp force. Weld shrinkage stress is
essentially the metal's yield strength; even one small fillet tack, fully
restrained, generates roughly:

```
F ≈ throat × yield ≈ (0.707 × 0.12" × 0.5") × ~50,000 psi ≈ ~2,000 lbf
```

Scaled over a full weld-out that's many thousands of pounds — beyond any hand
clamp, and brute-forcing it just relocates stress or cracks the weld. **Sequence
+ tacking controls distortion, not clamps.**

What the clamps *do* need to resist is only **positioning load** — holding the
light tubes flat against the jig (a leg ~5 lb, a horizontal ~3 lb) and the modest
spring of a cooling tack: **tens of pounds, design to ~100 lbf and you're over.**

- **Toggle clamps** (De-Sta-Co style, ~$6–10 ea, 100–700 lbf hold) screwed to the
  base — flip on/off, perfectly repeatable for frame #2. Ideal.
- **Wooden wedges** between a fixed block and the tube — free, simple.
- Existing **C-clamps / locking pliers** work but crowd the joints.

---

## Welding near wood (heat & spatter)

Workable if respected:
- Keep wood ~1½–2" back from the arc (joints open).
- **Anti-spatter spray** on the tubes so globules don't stick and smolder.
- Clear sawdust from the area; keep the extinguisher / water bottle right there.
- Expect light scorching on close stops — cosmetic. The steel magnetic squares
  take the real heat at the corners.

---

## Overall build order

1. **Cut tube to length** (legs cut LONG; everything else to `SPECS.md`).
2. **Drill + tap the plates while loose on the drill press** (easiest):
   - Plate A (3/8"-16) and foot-caps (M12×1.75). Use a **common drill template**
     per shelf level so every plate's hole pattern is identical → stretchers
     interchange between leg positions. Mask threads before welding.
3. **Build the end-frame jig**; weld the **two end-frames** (tack → square →
   weld → flip), per the sequence above.
4. **Weld plate A's** to the legs' inner faces at the three shelf heights
   (locate by measurement / a spacer block; keep both frames matched).
5. **Weld foot-caps** to the leg bottoms, **cable anchors** to the rear corner
   legs (do this now, before finish — see `DESIGN.md`).
6. **Drill the 1/2" relief holes** through each leg's back wall behind every
   tapped plate-A hole (24 total). DO NOT tap the leg wall.
7. **Long stretchers (×6):** drill plate B clearance holes (same template), weld
   plate B to each tube end; weld **angle-iron ledgers** to the 4 shelf
   stretchers (inset down by ply thickness, drilled for screws); weld **wood-top
   clips** to the 2 top stretchers.
8. **Finish:** degrease, self-etching primer, matte black — or disassemble and
   drop at a powder coater.
9. **Assembly on site:** bolt stretchers to end-frames (24× 3/8" bolts), dry-fit,
   **trim leg bottoms** to hit counter height, level with the feet (counter-end
   foot ~2.0", far end ~2.5"), then mount the wood top (slotted holes + inserts)
   and drop in the plywood shelves (screwed to the ledgers).

---

## Open items / to refine at the bench

- Exact stop layout and toggle-clamp positions for the jig.
- Plate-A vertical positioning fixture (a spacer/gauge block referencing the leg
  top) so both frames match without re-measuring.
- Whether to weld all 4 faces per joint or 3 (3 is structurally ample).

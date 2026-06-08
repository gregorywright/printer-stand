# Extrusion Option — T-slot Aluminum (4040 / 4080)

Living catalog of the pros and cons of building this 3D-printer stand from
**T-slot aluminum extrusion** with bolted fixtures, instead of the current
welded mild-steel tube design (see `DESIGN.md`). This is an **exploration**,
not a decision — nothing here changes the steel design unless we say so.

## Primer: how T-slot extrusion works

Aluminum bars with a **T-shaped groove down every face**. You don't weld or
drill the structure — you join bars with **T-nuts** (slid or dropped into the
slot) + bolts, through **corner brackets / gussets** or **hidden internal
connectors**. Named sizes are just millimetres — 2020 (20×20), 4040 (40×40),
4080 (40×80) — and the 40-series uses an 8 mm slot.

It's a mature ecosystem: 80/20 (the US "industrial erector set"), Misumi,
Bosch Rexroth, plus cheaper imports. It's what many 3D printers (Voron,
enclosures), machine guards, workbenches, and camera rigs are built from —
think "structural LEGO for adults." The appeal is that the structure stays
re-openable and re-mountable: anything can bolt anywhere on any face, and move
later.

## What "the extrusion build" means

- **Members:** 40-series T-slot aluminum (6063-T5), usually black anodized.
  - `4040` = 40 × 40 mm, `4080` = 40 × 80 mm (8 mm slot).
- **Joints:** bolted, not welded — corner brackets / gussets, hidden internal
  connectors (anchor / end fasteners), and T-nuts (drop-in or slide-in).
- **No welding, no paint/powder.** Cut to length (often supplier-cut to ±0.5 mm)
  and assemble with hex keys.
- **Feet:** leveling feet end-tapped into the profile or mounted via base plates.
- **Top & shelves:** held with T-nuts + brackets/plates; slotted holes still
  used so the solid wood top can move.

---

## Pros

**Build / process**
- No welding required — no burn-through, distortion, fumes, or fire risk; far
  more forgiving for a first build, and squareness comes from the profile, not
  from skill.
- No finishing step — anodized aluminum is "done" off the shelf.
- Dead-straight, dimensionally consistent members; easy accurate assembly.
- Suppliers cut-to-length and often pre-tap, shrinking shop work to assembly.

**Function (printer-specific)**
- **Reconfigurable.** The T-slots let you mount/relocate anything — AMS side
  mount, spool holders, cable management, lighting, drawers, an enclosure
  later — anywhere on any face. This is a genuine, ongoing advantage for a
  machine that accretes accessories.
- **Native knockdown.** Bolted throughout, so it disassembles for the doorway
  and reconfigures for new locations easily.
- Shelf heights become trivially adjustable (just move the brackets).

**Other**
- Aluminum doesn't corrode; no dissimilar-metal worries.
- Lighter to handle and move.

---

## Cons

**Cost**
- Usually **more expensive** than mild steel — profile is pricier per foot and
  the connectors/brackets/T-nuts/plates add up fast. Plausibly 1.5–3× the steel
  build's material cost; needs a real BOM to confirm.

**Rigidity / dynamics (we cared a lot about this — see DESIGN.md)**
- **Bolted joints are the weak link.** A welded steel corner is a rigid moment
  connection; a bracketed T-slot corner has more compliance and can rack unless
  well gusseted. For the A1 bedslinger resonance question, joint rigidity is
  exactly what matters.
- **Aluminum E ≈ 10 Msi vs steel ≈ 29 Msi (~1/3).** Section stiffness `EI`:
  - `4040` Ix ≈ 0.22 in⁴ → `EI` ≈ 2.2 M·lb·in², about **36%** of the
    1.5"×0.120" steel tube (`EI` ≈ 6.15 M·lb·in²).
  - `4080` in its strong orientation has a much larger `I` and can **match or
    beat** the steel tube's bending stiffness — at more cost/weight.
- **Lower mass is double-edged.** An aluminum stand is lighter (less "planted"
  inertia against a vibrating printer), though lower mass also raises natural
  frequency. Net resonance behavior depends on profile + bracing + connectors;
  not a clear win or loss without analysis.
- **Fastener loosening is *not* an issue for the A1 specifically.** The ~2–5
  lbf bed force is far below the joint slip threshold, so the Junker
  self-loosening mechanism isn't triggered (see "Will the A1 bed loosen
  T-nuts?" below). It's a real concern only for *under-preloaded* joints or a
  strong resonance match — mitigated by proper torque, bracing, and an optional
  dab of thread-locker.

**Fit with THIS project**
- **Kills the welding-skills goal.** A big point of this build was deliberate
  welding/tapping practice on a forgiving first project. Extrusion removes that.
- **Aesthetics.** The chosen look is warm wood + matte-black steel furniture.
  Black-anodized 4040 reads more "lab / maker / machine frame." Subjective, but
  the owner has weighted aesthetics as first-class.
- **Sunk progress.** Steel tools acquired, leveling feet bought and measured,
  welding practice planned, OnShape model underway — switching discards much of
  this.

---

## Against the hard constraints (`SPECS.md`)

| Constraint | Welded steel (current) | T-slot extrusion |
|---|---|---|
| Wood top 48"×25.75", 37" tall | ✔ | ✔ |
| Knockdown through 28" doorway | ✔ (welded end-frames + bolted stretchers) | ✔ (fully bolted — even easier, more pieces) |
| Wood seasonal movement | ✔ slotted holes | ✔ slotted holes + T-nuts (easy) |
| No-wobble under fast A1 print | ✔ (heavy, welded, triangulated) | ⚠ achievable but joint-rigidity-dependent; brace well |
| Open front | ✔ | ✔ |
| AMS side-mount / accessories | ✔ (bolt-on) | ✔✔ (T-slot excels here) |
| Counter-flush height, sloped floor | ✔ leveling feet | ✔ leveling feet |
| Looks like furniture | ✔ (intent) | ⚠ more industrial |

---

## Will the A1 bed loosen T-nuts? (calculated)

Short answer: **no, not from the bed force alone**, even over months.

**Forcing.** Moving Y mass ≈ 1 kg, max accel ≈ 10 m/s² (~1 g), so the
oscillating reaction on the frame is `F = m·a ≈ 10 N ≈ 2.25 lbf` (call it
≤5 lbf worst case).

**Cycles.** The bed reverses ~1–5×/sec during infill; at ~2/sec for 8 h/day
that's ~57,600 cycles/day → ~0.8 M in two weeks, a few million in a month. So
the cycle count really is large — but that turns out not to be the deciding
factor.

**Why cycles don't loosen it.** Bolts self-loosen by the *Junker* mechanism —
transverse vibration that makes the clamped faces **slip**, letting the threads
ratchet off. The trigger is a force *threshold*, not a cycle count:

    slip threshold per fastener = μ × clamp load

A conservatively-torqued M8 T-slot bolt (clamp ~300 lbf — well under its limit,
to respect the T-nut/slot; μ ≈ 0.2) gives a slip threshold of ~**60 lbf**, per
*single* fastener. The bed's ~2–5 lbf, shared across dozens of joints, is
**~15–30× below** that. Below the slip threshold there's no relative motion to
ratchet the bolt, so loosening is ~zero no matter how many million cycles
accumulate. (Cycle count only matters once a joint is *already* slipping.)

**Where the concern is still real:**
- **Under-tightened** fasteners have a low slip threshold and *can* creep loose
  — the fix is proper preload, not the bed's doing.
- **Resonance.** A lightly-damped frame mode at the bed's excitation frequency
  can amplify local force by the mode's Q (~10–50×): 5 lbf × 30 ≈ 150 lbf could
  approach slip. Needs a resonance match + low damping + a marginal joint —
  avoidable with bracing + preload; thread-locker is cheap insurance.

(This corrects an earlier overstated "the bedslinger will loosen T-nuts over
time" — for this light printer, properly preloaded joints won't.)

## Open questions / to investigate

- Real material BOM + cost for a 4040 (or 4080-leg) version vs. the ~$345–625
  steel build.
- Which profile where: 4080 legs/long members for stiffness, 4040 elsewhere?
- Bracing strategy: gussets vs. diagonal extrusions vs. corner cubes — and the
  resulting joint rigidity vs. the A1's excitation.
- Connector class: economy brackets vs. hidden internal connectors (stiffer,
  cleaner, pricier).
- Anti-loosening: thread-locker, serrated/drop-in T-nuts, re-torque interval.
- Does the lighter mass actually help or hurt the resonance margin? (Would
  re-run the tap-test thinking from DESIGN.md.)
- Hybrid? e.g., steel base/legs + extrusion top deck — usually worst of both,
  but note it.

## Running notes / current lean

- _(empty — add as we discuss)_

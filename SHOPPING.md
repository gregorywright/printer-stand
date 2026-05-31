# Shopping List — Parts & Consumables

Everything that gets *consumed* by the build — steel, hardware, paint,
fasteners. Tools and PPE are in `TOOLS.md`.

The two SCAD variants share most of this list. The only difference is
the back bracing:
- **Cable-X variant** (`printer_stand.scad`) uses tensioned aircraft cable
- **Z-back variant** (`printer_stand_zback.scad`) uses two welded tube
  diagonals, which come out of the same tube stock as the rest of the frame

So the **steel order is the same for both variants** (3 sticks of tube
covers either one). Only the cable hardware differs.

Items checked are already on hand or already ordered.

---

## Steel stock (both variants)

- [ ] **1.5"×1.5"×0.120" wall A500 square tube** — buy **3× 20-ft sticks** (~60 ft)
  - Used on: legs, end-frame horizontals, end-frame diagonals, long stretchers, plus the back-panel diagonals on the Z-back variant
  - ~52.4 ft used, rest is waste/practice margin
- [ ] **3/4"×3/4"×1/8" mild steel angle** — buy **1× 20-ft stick** (~20 ft)
  - Used on: 4 angle-iron ledgers, 39.875" each (~13.3 ft used)
- [ ] **1.5"-wide × 3/8" flat bar** — buy **7 ft**
  - Cut to 5" lengths for plate A (12 plates = 5 ft), plus 4 × 1.5" foot-cap
    plates for the leg ends (~6") — buying 7 ft covers both with margin
  - Tip: buy *flat bar* in the exact width you need. Way cheaper than
    cutting plates out of sheet.
- [ ] **1.5"-wide × 3/16" flat bar** — buy **6 ft**
  - Cut to 5" lengths for plate B (12 plates needed)

**Where to buy:** local steel supplier (search "metal supply" or "steel
service center"). Walk-in pickup, full-length sticks, often cut-to-length
for free. **Avoid Home Depot / Metals Depot / eBay** — typically 50–100%
more expensive on tube.

**Estimated cost (local supplier):**

| Stock | Cost range |
|---|---|
| Tube ×3 sticks | $180–$300 |
| Angle ×1 stick | $20–$40 |
| 3/8" flat bar (6 ft) | $15–$25 |
| 3/16" flat bar (6 ft) | $8–$15 |
| **Steel subtotal** | **$220–$380** |

---

## Welding consumables (both variants)

- [ ] **Flux-core wire**, E71T-11, 0.030" diameter, **2-lb spool**
  - 10-lb spool is more economical if you'll do future projects
- [x] Anti-spatter nozzle dip (already have)
- [ ] Anti-spatter spray (different product — protects the workpiece;
  optional, makes cleanup faster but not required)

---

## Hardware — flange-plate joints (both variants)

- [ ] **3/8"-16 × 1" hex bolts**, qty **30** (24 needed + spares)
  - Grade 5 zinc-plated *or* 18-8 stainless are both fine. Stainless
    looks cleaner and won't rust; grade 5 is a touch stronger if it
    matters (it doesn't, here).
  - If using stainless: lubricate threads on assembly to prevent galling
- [ ] **3/8" flat washers**, qty 30 — one per bolt under the head

---

## Hardware — leveling feet (both variants)

- [ ] **1/2"-13 swivel-base leveling feet**, 2" base, ~1.5" stud, qty **4**
  - McMaster: search "leveling mount" and filter by stud thread 1/2"-13,
    stud length 1-1/2", base diameter 2", mount style swivel
  - Amazon alternative: "1/2-13 leveling foot 2 inch swivel" (cheaper, fine for indoor furniture)
- [ ] **Make your own foot-cap plates**: 4 × 1.5"×1.5"×3/8" steel squares,
  welded onto the leg ends (cap), then tapped 1/2"-13 for the leveler studs
  - Cut from the 3/8" flat-bar offcut (see Steel stock) — no extra material
  - **Bosch BDT12F13** 1/2"-13 plug tap + 27/64" drill combo (~$13) does the tapping
    (a tool — also listed in `TOOLS.md`)

---

## Hardware — wood top mounting (both variants)

- [ ] **3/8"-16 threaded inserts for wood** (E-Z Lok or knife-thread), qty **4–8**
- [ ] **3/8"-16 × 1" pan-head machine screws**, qty 4–8 (match insert count)
- [ ] **1" fender washers**, qty 4–8 — big OD to span the slotted holes

---

## Cable-X variant ONLY (`printer_stand.scad`)

Skip this entire section if building the Z-back variant.

- [ ] **1/8" stainless 7×19 aircraft cable**, ~12 ft (two diagonals + termination overhead)
- [ ] **Swage eye terminations**, stainless, qty **4**
- [ ] **Stainless turnbuckles**, jaw-and-jaw, 3/16" or 1/4" stock, qty **2**
- [ ] **Eye plates** for legs, qty **4** — small steel pieces welded as anchor points

**Cable hardware subtotal:** ~$80–$120

---

## Z-back variant ONLY (`printer_stand_zback.scad`)

**No additional parts.** The two back-panel diagonals come out of the
3 sticks of tube already counted above. This variant is ~$80–$120 cheaper
than the cable variant (no cable hardware to buy).

---

## Finishing (both variants)

Pick one path:

**DIY rattle-can** (~$50)
- [ ] Acetone or denatured alcohol (degrease before painting)
- [ ] Self-etching primer for steel, 1 can
- [ ] Matte/satin black enamel top coat, 2–3 cans

**Powder coat** (~$100–200, recommended for durability)
- [ ] Drop the disassembled frame at a local powder coater. Disassemble
  first — the powder coater bakes the parts in an oven and they need to
  fit in racks.

---

## Floor protection (both variants)

- [ ] Self-adhesive felt or rubber pads for leveler bases — protect tile
  and add friction so the stand doesn't creep when the printer accelerates

---

## Cost rollup

| Category | Cable-X variant | Z-back variant |
|---|---|---|
| Steel stock | $220–$380 | $220–$380 |
| Welding consumables | ~$15 | ~$15 |
| Bolts + washers | ~$15 | ~$15 |
| Levelers + 1/2"-13 tap | ~$65 | ~$65 |
| Wood-top mounting hardware | ~$10 | ~$10 |
| Cable hardware | $80–$120 | — |
| Finishing (DIY) | ~$50 | ~$50 |
| Floor pads | ~$5 | ~$5 |
| **Total parts cost** | **~$455–$655** | **~$375–$535** |

If powder-coating instead of rattle-can, add ~$100.

---

## Wood (you have this)

- [x] Hardwood for the top, ~48"×25.75"×**1-3/16"** (matches the adjacent
  counter). Red oak / white oak / hard maple — hard enough not to dent in
  light bench use. Plane to final thickness after measuring the built frame.
- [x] Plywood for the two shelves: cut to fit after the frame is built
  (from one 4'×8' sheet of 3/4" plywood)

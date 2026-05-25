# 3D Printer Stand — Specifications

Hard requirements and dimensions for the stand. Anything in this file is fixed
unless explicitly renegotiated. Soft design choices live in `DESIGN.md`.

## Top-level dimensions

| Dimension | Value | Notes |
|---|---|---|
| Wood top length (X) | **48"** | Fixed — set by intended use |
| Wood top depth (Y) | **25.75"** | Fixed |
| Total height (floor → top of wood) | **37"** | Must match adjacent kitchen counter exactly |
| Wood top thickness | **~1.75"** (target) | Hand-built; tolerance ±1/4". Final height tuned via shims. |
| Wood overhang | **2" on all 4 sides** | Lets feet clear baseboard/molding; lets top butt against counter |

## Steel frame footprint (derived)

| Dimension | Value |
|---|---|
| Steel frame length (X) | 48 − 2·2 = **44"** |
| Steel frame depth (Y)  | 25.75 − 2·2 = **21.75"** |
| Steel frame top height | 37 − 1.75 = **35.25"** (nominal — tuned at install) |

## Constraints

- **Knockdown required.** Stand must disassemble to pass through a 28"-wide,
  74"-tall doorway with a wall 37" away (forces a tight turn). No single
  assembled element may exceed those limits.
- **Counter-flush height.** The top must end up *exactly* level with the
  adjacent kitchen counter so equipment can straddle the seam. Height is
  tuned at the wood-to-steel interface (shims), not the levelers.
- **Wood movement.** A solid hardwood top of this depth moves ~1/4" across
  grain seasonally. The mounting system must allow this movement without
  cracking the top. (Slotted holes + fender washers; anchor at one point.)
- **Rigidity.** Stand must not visibly wobble while a Bambu A1 (bedslinger,
  front-back motion) prints at fast speeds.
- **AMS 2 Pro side-mount only.** Ceiling has pipes; AMS cannot stack on top
  of any printer. Stand height cannot be reduced (counter-match constraint),
  so the AMS lives on a side mount attached to the printer.
- **Tile floor.** 12"×12" tiles. Levelers position over tile centers, not
  grout lines. Felt/rubber under leveler bases to protect tile and add friction.
- **Front of stand must be open.** No bracing on the front face — printer
  loads/operates from the front.

## Materials

| Component | Spec |
|---|---|
| Frame tubing | 1.5" × 1.5" × 0.120" wall, A500 mild steel |
| Flange plates | 3" × 3" × 3/16" mild steel |
| Bolts | 3/8"-16 grade 5+, ~1.25" long, with flat washers + nylock nuts |
| Leveler studs | 1/2"-13 |
| Leveler base | 2" diameter, swivel-base type |
| Leveler insert | Weld-in threaded insert, 1/2"-13, ~3/4" engagement length |
| Cable (back X) | 1/8" stainless 7×19 aircraft cable |
| Cable terminations | Swaged eye ends, 2 turnbuckles (jaw-and-jaw stainless) |
| Cable anchors | Welded eye plates on rear face of corner legs |
| Shelves | 3/4" plywood (or hardwood — woodworker's choice) |
| Wood top | Hand-built by owner, ~1.75" thick |

## Heights / shelf layout

| Element | Z (top of, off floor) |
|---|---|
| Bottom shelf | 5" |
| Middle shelf | 17" |
| Steel top frame | 35.25" |
| Wood top surface | 37" |

## Joints

- **Welded:** all corners and members within each end frame, including the
  internal diagonal. Knee-brace-to-stretcher welds on the long stretchers.
- **Bolted:** all 6 long stretchers attach to end frames via flange plates
  (4 bolts per joint × 12 joints = 48 bolts total).
- **Tensioned:** cable X on rear face only. Re-tension after first month of use.

## Frame member count

| Member | Qty | Length (approx.) | Wall |
|---|---|---|---|
| Legs | 4 | 34.75" | 0.120" |
| End-frame horizontals (per shelf level + top, both end frames) | 6 | 18.75" | 0.120" |
| End-frame diagonals (one per end frame, lower bay) | 2 | ~21.5" | 0.120" |
| Long stretchers | 6 | ~40.25" between flange faces | 0.120" |
| Top knee braces | 4 | ~8.5" | 0.120" |
| Flange plates | 24 | 3"×3"×3/16" | — |

## Weight (estimated)

| Group | Weight |
|---|---|
| Steel tube + plates | ~120 lb |
| Hardware (bolts, levelers, cable) | ~15 lb |
| Wood top + shelves | ~50 lb |
| **Assembled total** | **~185 lb** |

## Site

- Built in: garage
- Used in: room adjacent to kitchen, low-ceiling (with overhead pipes)
- Floor: tile, 12"×12" tiles
- Adjacent surface: kitchen counter — top must match its height exactly

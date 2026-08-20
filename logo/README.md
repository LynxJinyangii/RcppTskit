# RcppTskit logo

## Sources

`variants/g7-editable.svg` is the editable source for the selected wordmark.
Its `R`, `cpp`, and `T` elements are live text. Open it only on a system with
Zilla Slab Bold installed; otherwise an SVG editor may silently substitute a
different font and change the design.

`variants/g7.svg` is the portable artwork used by the build script. Its text
has been converted to paths, so it renders consistently without an installed
font. Edit the live-text source and then regenerate this path-based version
rather than editing the letter outlines independently.

The remaining files in `variants/` record earlier design alternatives.

## Typeface

The live text uses Zilla Slab Bold (weight 700), version 1.002. The exact font
file used to generate the production outlines is available from the Google
Fonts repository:

<https://raw.githubusercontent.com/google/fonts/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/ZillaSlab-Bold.ttf>

Its SHA-256 checksum is:

```text
4ec3a04a4eef37074b42ef542e4d874e13646668cfe65256e0bf100441cf8719
```

Zilla Slab is distributed under the SIL Open Font License 1.1; see the
[license in Google Fonts](https://github.com/google/fonts/blob/62f61985b394df2acc8d286c45ad3bf8491698ae/ofl/zillaslab/OFL.txt).

The `skit` lettering is retained as vector artwork from the tskit wordmark.
It is intentionally not replaced with Zilla Slab: the capital `T` is aligned
optically to the visible top and bottom of the vector `k`.

## Editing the artwork

1. Install the exact Zilla Slab Bold font above.
2. Open `variants/g7-editable.svg` in Inkscape and confirm that Zilla Slab Bold
   is used without font substitution.
3. Select the live `R`, `cpp`, and `T` text and use **Path > Object to Path**.
4. Save the result as `variants/g7.svg`, preserving the page and group
   geometry from the editable source.
5. Check the result in both Inkscape and a browser.

## Building the final logo

Install the required R packages once:

```r
install.packages(c("hexSticker", "magick", "rsvg", "svglite"))
```

Then, from the repository root, run:

```sh
make -C logo
```

The Makefile runs `logo/logo.R`, which uses `variants/g7.svg` to populate:

- `logo/logo.svg`: canonical hexSticker composition, with the artwork embedded;
- `logo/logo.png`: high-resolution raster logo; and
- `logo/variants/g7_hexsticker.png`: copy of the final raster logo retained
  with its variant name; and
- `RcppTskit/man/figures/logo.png`: 240-pixel-wide package/README logo.

Run `make -C logo clean` to remove these generated files.

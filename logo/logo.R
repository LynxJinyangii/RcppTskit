required_packages <- c("hexSticker", "magick", "rsvg", "svglite")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_packages) > 0L) {
  stop(
    "Install the required packages first: install.packages(c(",
    paste(sprintf("\"%s\"", missing_packages), collapse = ", "),
    "))"
  )
}

artwork <- magick::image_read_svg("variants/g7.svg", height = 3000)
artwork <- magick::image_extent(
  artwork,
  geometry = "4000x3650",
  gravity = "center",
  color = "none"
)
artwork <- magick::image_extent(
  artwork,
  geometry = "4000x4000",
  gravity = "north",
  color = "none"
)
temporary_artwork <- tempfile(fileext = ".png")
magick::image_write(artwork, path = temporary_artwork, format = "png")

hexSticker::sticker(
  subplot = temporary_artwork,
  package = "",
  s_width = 0.82,
  s_x = 1,
  s_y = 0.99,
  h_fill = "white",
  h_color = "#045167",
  h_size = 1.5,
  white_around_sticker = FALSE,
  dpi = 600,
  filename = "logo.svg"
)
unlink(temporary_artwork)

logo <- magick::image_read_svg("logo.svg", height = 1200)
magick::image_write(logo, path = "logo.png", format = "png")
stopifnot(file.copy("logo.png", "variants/g7_hexsticker.png", overwrite = TRUE))

# This is the deterministic equivalent of usethis::use_logo(
#   "logo.png", geometry = "240x278", retina = TRUE
# ), without its interactive overwrite check.
package_logo <- magick::image_resize(logo, geometry = "240x278")
magick::image_write(
  package_logo,
  path = "../RcppTskit/man/figures/logo.png",
  format = "png"
)

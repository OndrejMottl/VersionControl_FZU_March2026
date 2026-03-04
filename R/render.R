#----------------------------------------------------------#
#
#
#                  Version Control FZU
#
#                  Render presentation
#
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

# Setup -----

library(here)
library(quarto)
library(fs)
library(qpdf)

# Render -----
quarto::quarto_render(
  input = here::here("presentation.qmd")
)

# Make PDF version -----

# decktape needs to be installed separately.
# See https://github.com/astefanutti/decktape
system2(
  command = "decktape.cmd",
  args = c(
    "reveal",
    "--fragments=true",
    "--size 1050x700",
    here::here("index.html"),
    here::here("presentation_raw.pdf")
  )
)

# compress the PDF to make it small enough to uplot to GH
qpdf::pdf_compress(
  input = here::here("presentation_raw.pdf"),
  output = here::here("presentation.pdf")
)

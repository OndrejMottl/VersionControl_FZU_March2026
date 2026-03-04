# Version Control FZU — March 2026

Slides for the **Introduction to GitHub and Version Control** session (FZU, March 2026), built with [Quarto](https://quarto.org/) + [Reveal.js](https://revealjs.com/) and rendered from R.

🖥️ **View the slides:** [bit.ly/mottl_prez_fzu_202603](https://bit.ly/mottl_prez_fzu_202603)

## What is in this repository

- Main slide deck source: `presentation.qmd`
- Rendered presentation: `index.html`
- Final PDF handout: `presentation.pdf`
- Custom Reveal.js theme: `custom_theme.scss`
- Theme inputs:
 	- `colors.json` → auto-generates `_colors.scss`
 	- `fonts.json` → auto-generates `_fonts.scss`
- Rendering helper script: `R/render.R`
- Assets (logos, figures, exercises, markdown/git/github materials): `Materials/`
- Reproducible R environment: `renv/`

## Requirements

1. [Quarto](https://quarto.org/docs/getting-started/installation.html)
2. R (with packages managed by `renv`)
3. Optional for PDF export: [decktape](https://github.com/astefanutti/decktape)

## Setup

Open the project in RStudio or VS Code, then restore R dependencies:

```r
if (!require("renv")) install.packages("renv")
renv::restore(prompt = FALSE)
```

> The setup chunks in `presentation.qmd` also check and install key packages when needed.

## Rendering

### HTML slides

Render from Quarto directly:

```bash
quarto render presentation.qmd
```

This creates/updates `index.html`.

### HTML + PDF (via helper script)

Run:

```r
source("R/render.R")
```

The script will:

1. Render `presentation.qmd` to `index.html`
2. Export slides to `presentation_raw.pdf` via `decktape`
3. Compress `presentation_raw.pdf` to `presentation.pdf`

### PDF-only notes

- `decktape` is required for creating PDF files from Reveal.js slides.
- `qpdf` is used to compress the raw PDF for easier sharing/upload.
- If `decktape` is not installed, HTML rendering still works, but PDF export steps will fail.

## Editing the theme

- Edit `colors.json` and `fonts.json` to control palette and typography.
- During render, corresponding SCSS partials are regenerated automatically.
- Adjust spacing/layout/typography rules in `custom_theme.scss`.

## Notes

- `index.html` is configured as the primary output file in the Quarto reveal format options.
- The deck uses embedded resources for portable sharing.

## License

See `LICENSE`.

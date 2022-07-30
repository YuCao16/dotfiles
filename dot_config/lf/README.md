# FL Configuration

## Requirements (Optional)

1. kitty -- Draw images
2. pandoc -- Convert files to markdown
3. bat -- Display texts
4. vivid -- Themes
5. ffmpegthumbnailer -- Preview videos
6. poppler -- Preview PDF files (pip)
7. glow -- Preview markdown files
8. gnumeric -- Convert `*.xlsx` to `*.csv` files
9. exiftool -- Preview audio files
10. librsvg -- Convert `*.svg` files to `*.png`

## Installation

1. Install `LF`
2. Move `lfrun` file to a directory that is in your `$PATH` variable (such as
   `/usr/local/bin`)
3. Extract the following files: `cleaner`, `preview` and `icons` to
   `~/.config/lf/`
4. Edit your `~/.config/lf/lfrc` file and add the follwoing lines:

   ```bash
   set previewer ~/.config/lf/preview
   set cleaner ~/.config/lf/cleaner
   set icons
   ```

5. Install `vivid` and add
   `export LS_COLORS="$(vivid generate iceberg-dark)"` to `~/.zshrc`
   (Optional).

## Usage

Follow the instructions on [LF](https://pkg.go.dev/github.com/gokcehan/lf#readme-usage)

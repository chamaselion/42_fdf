# FdF

A wireframe map renderer (42 School project) that reads height maps and displays an isometric projection with MiniLibX.

## Platform

This implementation is set up and tested for **Linux**.

## Dependencies

### Core
- `gcc` (or compatible C compiler)
- `make`
- Standard C library + math library (`-lm`)

### External libraries
- `libft/` (included in this repository and built automatically)
- MiniLibX Linux (`mlx/`), cloned automatically by the Makefile from:
  - `https://github.com/42paris/minilibx-linux`

### Linux system packages (for MiniLibX)
Install X11 development dependencies if missing (package names vary by distro), typically:
- `libx11-dev`
- `libxext-dev`
- `zlib1g-dev`
- `libbsd-dev` (sometimes needed by mlx test target)

## Build & Usage

### Build
```bash
make
```

### Rebuild from scratch
```bash
make re
```

### Run
```bash
./fdf <filename.fdf>
```

Important: this implementation resolves maps from `test_maps/`, so `<filename.fdf>` must exist under that folder (e.g. `test_maps/42.fdf`).

Example:
```bash
./fdf 42.fdf
```

## Map file format rules

This project parses **`.fdf`** files.

Each line is a row in the grid, and each token is one point:

- Required height only: `z`
- Optional color: `z,0xRRGGBB`

### Accepted token examples
- `0`
- `-3`
- `12,0xFF00AA`

### Row/spacing rules
- Tokens are separated by whitespace.
- Leading/trailing spaces are tolerated.
- Empty files are invalid.
- Keep a rectangular map (same number of points in every row) for predictable rendering.

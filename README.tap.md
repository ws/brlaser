# Homebrew Tap for brlaser

This is a Homebrew tap for [brlaser](https://github.com/pdewacht/brlaser), a CUPS driver for Brother laser printers.

**Note:** This tap has been tested on a Brother HL-2300D and works great! While the upstream brlaser project supports many Brother models, this specific Homebrew packaging has only been verified on that one model so far. Your mileage may vary with other models.

## Installation

First, tap this repository:

```bash
brew tap ws/brlaser
```

Then install the driver cask:

```bash
brew install --cask brlaser
```

The installation will:
- Prompt for your password (required to install to system CUPS directories)
- Build and install the driver
- Automatically restart CUPS

## Usage

After installation, add your Brother printer using System Settings > Printers & Scanners. Look for printer entries marked 'brlaser'.

## Supported Printers

See the [main brlaser README](https://github.com/pdewacht/brlaser#readme) for a full list of supported printers, including:
- Brother DCP series (DCP-1510, DCP-1600, DCP-7xxx, DCP-L2xxx)
- Brother HL series (HL-1110, HL-1200, HL-2xxx, HL-L2xxx)
- Brother MFC series (MFC-7xxx, MFC-L2xxx)

## About

This tap packages the brlaser driver for easy installation on macOS via Homebrew. The original driver is maintained by [Peter De Wachter](https://github.com/pdewacht).

## Credits

Big thanks to [@kktse](https://github.com/kktse) for their [excellent gist on packaging CUPS drivers for Homebrew](https://gist.github.com/kktse/5967bbedc467f3e429d7b781aa27d978) - this tap wouldn't have been possible without that documentation!

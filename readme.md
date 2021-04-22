# hdrfix - a tool for mapping HDR screenshots to SDR

This is a tool I wrote for my personal usage dealing with HDR (high dynamic range) screenshots of Microsoft Flight Simulator, as taken with Nvidia's GeForce Experience game overlay capture utility which saves a JPEG XR which should contain full 10-bit range, and an 8-bit-per-channel PNG with lower resolution information, but still encoded in BT.2100 color space.

Output files as regular SDR (standard dynamic range) PNGs in bog-standard sRGB colorspace. There are a few parameters for adjusting the conversion.

# Author, repo, etc

* Brion Vibber `<brion @ pobox.com>`
* https://github.com/brion/hdrfix
* license: MIT

# Dependencies

* clap for CLI setup
* glam for vector/matrix math
* thiserror for error conglomeration
* png for reading input PNG
* mtpng for writing output PNG

# Installation

(untested, not yet published)

```
cargo install hdrfix
```

# Usage

Basic conversion:

```
hdrfix screenshot.png output.png
```

Interactive help!

```
hdrfix --help
```

Adjustable parmeters are `--gamma`, `--sdr-white` and `--hdr-max`, all of which take numeric arguments:
* `--sdr-white=N` linearly scales the input signal such that a signal representing standard dark-room SDR white point of 80 nits is scaled up to the given value instead. The default is `80`, passing through the standard signal.
* `--gamma=N` applies a power curve against the linear luminance signal before compressing the dynamic range to SDR. The default is `1.4`, which increases contrast pleasantly to compensate for the loss of contrast from the tone-mapping.
* `--hdr-max=N` sets the maximum luminance level for the Reinhold tone-mapping algorithm. It has relatively modest effect, and defaults to `1000` nits.

I found a gamma of 1.4 to be pleasing to the eye on several sample screen captures, but it's an easy parameter to adjust as needed!
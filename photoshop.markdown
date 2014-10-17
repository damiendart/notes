Photoshop Notes
===============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Yet Another Inking Photoshop Brush
----------------------------------

  - Select the pencil tool.
  - In the _Brush_ panel select the _Hard Round Pressure Size_ preset.
  - In the _Brush Tip Shape_ options set, set the hardness to 100% and
    spacing to 1%.
  - In the _Shape Dynamics_ options set, set the size jitter control to
    _Pen Pressure_.
  - In the _Scattering_ options set, set the scatter to 30% and the
    count to 2.
  - Enable _Smoothing_.

As this brush isn't anti-aliased, [working in high document resolutions
is recommended][1]. I tend to use this brush at size 90 when drawing on
an A4-sized document with a resolution of 600 PPI. and with the tip feel
set one notch below firm in the Wacom preferences panel.

[3]: <http://fox-orian.tumblr.com/post/31595044234>


Scanning and Cleaning up Line-art and Pencil Work
-------------------------------------------------

I use [VueScan][4] to scan in line-art and pencil work. VueScan's
_Line-art_ preset is good enough for scanning line-art, though I bump up
the scan resolution to at 600 DPI. Once scanned, I use Photoshop to
touch things up:

[4]: <http://www.hamrick.com/>

  1. Open up your scanned line-art and, if necessary, make any
     _Curves_ and/or _Levels_ adjustments to improve the line quality.
  2. In the _Channels_ palette click on an individual colour channel
     while holding down the _Control_ key to create an aliased selection
     of the white areas of the line-art.
  3. Invert the selection and on a new transparent layer fill the
     selection black with the _Paint Bucket_ tool.
  4. Deselect the selection and delete or hide the scanned line-art.

For pencil work which I intend to ink digitally, I still use VueScan's
_Line-art_ preset but don't bother with further fiddling in Photoshop, I
just slap the pencil work into its own layer and go from there.

Alternatively, for quick-and-dirty line-art or pencil work scanning for,
say, posting onto Tumblr, I scan with VueScan's _Color_ or _Grey_ preset
and then fiddle around with a _Levels_ adjustment layer in Photoshop. I
find this method handles whatever image-resizing methods the various
social media sites use better than the method above.

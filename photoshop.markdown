Photoshop Notes
===============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Creating Custom Photoshop Brushes
---------------------------------

The following recipe takes one of the default brush presets and tweaks
it to create one that is more suited towards illustration work. A
graphics tablet is required.

  - Select either the brush or pencil tool.
  - In the _Brush_ panel select the _Hard Round Pressure Size_ preset.
  - In the _Brush Tip Shape_ options set:
    - set the hardness to 0%, and
    - set the spacing to 1%.
  - In the _Shape Dynamics_ options set:
    - Set the size jitter control to _Pen Pressure_, and
    - set the minimum diameter to 20%.
  - If using the brush tool, in the _Texture_ options set:
    - Set the texture to any of the presets, it doesn't matter.
    - Then set the scale to 100%,
    - ensure _Texture Each Tip_ is enabled and the mode is set to
      _Height_, and
    - set the depth to 100%.
  - Ensure _Smoothing_ is enabled.

The settings in the _Texture_ panel give a faux-aliasing effect if using
the brush tool. This isn't necessary if using the pencil tool. [Remember
to work at high document resolutions when working with aliased brushes
for better results][3].

[3]: <http://fox-orian.tumblr.com/post/31595044234>

I use this brush with the pencil tool at size 20 when drawing on
an A4-sized document with a resolution of 300 pixels per inch. Adjust
the brush size accordingly when changing document resolution.


Cleaning up Line-art
--------------------

This is one of many ways of cleaning up scanned line-art.

  1. Put the scanned line-art in its own layer.
  2. If necessary, use _Curves_ and/or _Levels_ adjustments to clean up
     the line-art. (I usually get away with just a _Levels_ adjustment.)
  3. In the _Channels_ palette click on any of the individual colour
     channels while holding down the _Control_ key to create a selection
     of just the white areas of your line-art.
  4. Invert the selection and in a new transparent layer fill the
     selection black with the _Paint Bucket_ tool.
  6. Deselect the selection and delete or hide the layer with the
     original scanned line-art.


Miscellaneous Things
--------------------

  - When using a Wacom tablet, I generally set the tip feel to one notch
    below firm. I'll need to play around with this, though.

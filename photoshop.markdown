Photoshop Notes
===============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Creating Custom Photoshop Brushes
---------------------------------

The following recipe will give you a Photoshop brush that's more suited
for colouring and line-art than the default presets.

  - In the _Brush_ panel select the _Hard Round Pressure Size_ preset.
  - In the _Brush Tip Shape_ options set:
    - Set the angle to 45%,
    - set the roundness to 75%,
    - hardness to 100%, and
    - the spacing to 1%.
  - In the _Shape Dynamics_ options set:
    - Set the minimum diameter to 20%, and
    - set the angle jitter to be determined by the direction.
  - If using the brush tool, in the _Texture_ options set:
    - Set the texture to anything, it doesn't matter.
    - Then set the scale to 100%,
    - ensure _Texture Each Tip_ is enabled and the mode is set to
      _Height_, and
    - set the depth to 100%.
  - Ensure _Smoothing_ is enabled.

The settings in the _Texture_ panel give a faux-aliasing effect if using
the brush tool, which isn't necessary if using the pencil tool.

I use this brush with the pencil tool at size 40 when drawing on an
A4-sized document with a resolution of 300 pixels per inch. Adjust the
brush size accordingly when changing document resolution.

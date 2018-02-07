---
file_comment: |
  "photoshop.md" from Damien Dart's notes.

  Copyright (C) 2014-2018 Damien Dart, <damiendart@pobox.com>.
  This work is licensed under the Creative Commons Attribution 4.0
  International License. To view a copy of this license, visit
  <http://creativecommons.org/licenses/by/4.0/> or send a letter to
  Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
layout: note
page_description: View Damien Dart's notes on Photoshop.
page_licence: Creative Commons Attribution 4.0 International License
page_licence_website: "http://creativecommons.org/licenses/by/4.0/"
---


Photoshop Notes
===============


Current brushes of choice
-------------------------

From Kyle T Webster's Megapack:

  - For line art, _Kyle's Inkbox - Badass Brush_ at 35 pixels.
  - For colouring, _Kyle's Inkbox - Roughest Ink No Alias_ at 40 pixels.

The brush sizes assume a document with a resolution of 300 DPI.


Converting pencil artwork to non-repro blue
-------------------------------------------

  1. Open up the scanned pencil artwork in Photoshop and use a _Levels_
     adjustment layer to improve the line quality and whites.
  2. Clean up the artwork with white on a separate layer, if necessary.
  3. Convert the image to grayscale (using the _Mode_ menu found in the
     _Image_ menu) and then to monotone using 20% cyan as the primary
     ink. The shade of cyan used might depend on personal preference
     and printer output.


Cleaning up line art
--------------------

  1. Clean up the scanned line art in Photoshop with adjustment layers:
     -  Remove any non-repro blue underdrawings with a _Hue/Saturation_
        adjustment layer. After choosing the _Cyans_ colour range in the
        _Properties_ panel, set the saturation to minimimum and
        lightness to maximum.
     -  Use _Curves_ and/or _Levels_ adjustment layers to improve the
        line quality and whites, and remove any remaining underdrawings.
     -  For inked line art, use a _Threshold_ adjustment layer to
        convert the line art to black-and-white bitmap.
  2. At the bottom of the _Channels_ palette, click on _Load channel as
     selection_ to create a selection of the white areas of the image.
  3. Invert the selection.
  4. Create a fill layer; the selection will be applied to the fill
     layer's mask. Alternatively, use the _Paint Bucket_ tool to fill
     the selection on a new layer.
  5. Deselect the selection.
  6. Delete or hide the scanned artwork and adjustment layers.


Image filesize reduction techniques
-----------------------------------

  - Use [ExifTool][1] and [jpegtran][1] to reduce JPEG image filesizes:
    `jpegtran -optimize -progressive [IMAGE] > [OUTPUT] &&
    exiftool -all= --icc_profile:all [OUTPUT]`.

[1]: <http://jpegclub.org/jpegtran/>
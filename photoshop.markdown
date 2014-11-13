Photoshop Notes
===============

  - Author: [Damien Dart][1], <damiendart@pobox.com>
  - Licence: [Creative Commons Attribution 4.0 International License][2]

[1]: <http://www.robotinaponcho.net/>
[2]: <http://creativecommons.org/licenses/by/4.0/>


Scanning and Cleaning up Inked Line-art
---------------------------------------

I use [VueScan][3]'s _Grey_ preset when scanning in my inked line-art,
though I bump up the scan resolution to 600 DPI. Then, in Photoshop, I
do the following:

  1. Open up the scanned line-art and use a _Levels_ adjustment layer to
     improve the line quality and whites. (The remaining steps are only
     neccessary if you're planning to colour in the line-art.)
  2. At the bottom of the _Channels_ palette, click on _Load channel as
     selection_ to create a selection of the white areas of the image.
  3. Invert the selection and on a new transparent layer fill the
     selection black.
  4. Deselect the selection and delete the original scanned line-art.
  5. Change the image mode to either RGB or CMYK.

[3]: <http://www.hamrick.com/>

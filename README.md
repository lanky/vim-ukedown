# vim-ukedown

Syntax and filetype plugins (etc) for the `ukedown` songsheet markup syntax.
Tested with neovim and vim 8+

## Current features

* autodetect of filetype for '*.udn' files
* highlighting of section headers, chords, boxouts, backing vox and performance notes
* supports chords inside backing vocals
* supports all highlight groups inside `boxout` sections

## Missing features...

* figure out a way to highlight the title.
* inherit from markdown too, as ukedown is a special case of this
* need to override tables here as we use those for boxouts

## Current Highlight groups

All supported highlight groups are prefixed with `Udn`. The below are the defaults

`UdnBackingVox`     Italic
`UdnChord`          Bold, Magenta
`UdnSectionHeader`  Bold, Cyan
`UdnNotes`          Bold, Blue
`UdnBoxOut`         Bold
`UdnMetadata`       Italic, Yellow

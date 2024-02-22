" vim: set ts=2 sts=2 sw=2 et ci nu ft=vim:
" (neo)vim syntax file
" Language: ukedown (an extension of markdown)
" Maintainer: Stuart Sears
" Latest Revision: 2024-02-22

if exists("b:current_syntax")
  finish
endif

" headers are easy, anything in square brackets
syntax match UdnSectionHeader '\[[^[]\+\]'

" backing vox are tricky, anything in parens that is not a chord.
" but of course they can theoretically contain chords too!
syntax match UdnBackingVox '(.\+)' contains=ALLBUT,UdnBackingVox,UdnBoxOut

" chords are anything matching our chord regex, inside parentheses
" this is overly simplistic as it currently doesn't cover (e.g) Dmaj7sus4
" this is horrible, but still...
"                        | root     |    | 7 etc| voicing                      | number | alternate root |
syntax match UdnChord '([ABCDEFG][b#]\=\(\d\+\)\=\(m\|maj\|aug\|dim\|sus\|add\)\=\(\d\)\=/\=\([ABCDEFG][b#]\=\)\=\*\=)'

" performance notes etc, anything at all enclosed in curly braces {}
syntax match UdnNotes '{[^#)]\+}'

" notes and instructions for singers, enclosed in angle brackets <> 
syntax match UdnSinger '<[^<]\+>'

" document metadata (credits, bpm, font size etc)
syntax match UdnMetadata '^;.*'

" make it clear this can contain other elements, apart from itself.
" no nested boxes, dammit
syntax match UdnBoxOut '^|.*|\=$' contains=ALLBUT,UdnBoxOut

let b:current_syntax = "udn"

" font styles and colours
hi UdnSectionHeader cterm=bold   gui=bold   term=bold   ctermfg=Cyan    guifg=Cyan 
hi UdnChord         cterm=bold   gui=bold   term=bold   ctermfg=Magenta guifg=Cyan
hi UdnBackingVox    cterm=italic gui=italic term=italic ctermfg=yellow  guifg=yellow
hi UdnMetadata      cterm=italic gui=italic term=italic ctermfg=yellow  guifg=gray
hi UdnBoxOut        cterm=bold   gui=bold   term=bold
hi UdnNotes         cterm=bold   gui=bold   term=bold   ctermfg=Blue    guifg=Blue 
hi UdnSinger        cterm=bold   gui=bold   term=bold   ctermfg=Green   guifg=Green 

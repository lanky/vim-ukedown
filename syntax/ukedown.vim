" vim: set ts=2 sts=2 sw=2 et ci nu ft=vim:
" (neo)vim syntax file
" Language: ukedown (an extension of markdown)
" Maintainer: Stuart Sears
" Latest Revision: 2022-04-28

if exists("b:current_syntax")
  finish
endif

" headers are easy, anything in square brackets
syntax match UdnSectionHeader '\[.*\]'
" backing vox are tricky, anything in parens that is not a chord.
" but of course they can theoretically contain chords too!
syntax match UdnBackingVox '(.\+)' contains=UdnChord
" chords are anything matching our chord regex, inside parentheses
" this is overly simplistic as it currently doesn't cover (e.g) Dmaj7sus4
" this is horrible, but still...
"                        | root     |    | 7 etc| voicing                      | number | alternate root |
syntax match UdnChord '([ABCDEFG][b#]\=\(\d\+\)\=\(m\|maj\|aug\|dim\|sus\|add\)\=\(\d\)\=/\=\([ABCDEFG][b#]\=\)\=\*\=)'
" performance notes etc, anything at all enclosed in curly braces {}
syntax match UdnNotes '{[^#)]\+}'
syntax match UdnMetadata '^;.*'

" make it clear this can contain other elements, apart from itself.
" no nested boxes, dammit
syntax match UdnBoxOut '^|.*|\=$' contains=ALLBUT,UdnBoxOut

let b:current_syntax = "udn"

hi UdnSectionHeader cterm=bold   ctermfg=Cyan guifg=Cyan term=bold
hi UdnChord         cterm=bold   ctermfg=Magenta guifg=Cyan term=bold
hi UdnBackingVox    cterm=italic term=italic
hi UdnMetadata      cterm=italic ctermfg=yellow
hi UdnBoxOut        cterm=bold   term=bold
hi UdnNotes         cterm=bold   ctermfg=Blue

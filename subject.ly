\version "2.18.2"

\include "../lilypond-page-sizes/paper-sizes.ily"
\include "../lilypond-functions/functions.ily"

\header {
  tagline = ""
}

global = {
  \key g \minor
  \time 4/4
}

\layout {
  \context {
    \Staff
    \remove Time_signature_engraver
  }
}

\book {
  \paper {
    #(set-paper-size "size 4.25-1.25")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \relative g' { 
        \global 
        \partial 2 
        r8 g bes d, |
        cis4 d r8 e16 f g8 f16 e 
        f8 }
      \new Staff \relative bes {
       \clef bass
       \global
       \partial 2 
       bes4 g |
       \override TextScript.color = #red
       r8 a16-\markup { \postscript #(ps-rect 6.5 -0.75 7 13 0.25) } g f8 g16 a 
         bes8 g e cis' |
       d4.
      }
    >>
    \layout {}
    \midi { \tempo 4 = 80 }
  }
}


\book {
  \paper {
    #(set-paper-size "size 4.25-1.25")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \relative g' { 
        \global 
        \partial 2 
        r8 g bes d, |
        \override TextScript.color = #blue
        cis4 d r8 e16-\markup { \postscript #(ps-rect 7 -1.33 7 16 0.25) }
          f g8 f16 e 
        f8 }
      \new Staff \relative bes {
       \clef bass
       \global
       \partial 2 
       bes4 g |
       \override TextScript.color = #red
       r8 a16-\markup { \postscript #(ps-rect 6.5 -0.75 7 13 0.25) } g f8 g16 a 
         bes8 g e cis' |
       d4.
      }
    >>
    \layout {}
    \midi { \tempo 4 = 80 }
  }
}
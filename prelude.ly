\version "2.18.2"

\include "../lilypond-page-sizes/paper-sizes.ily"
\include "../lilypond-functions/functions.ily"

\header {
  tagline = ##f
}

global = {
  \key g \minor
  \time 4/4
}

gTrill = {
  \repeat unfold 4
  \tuplet 12/8 { \repeat unfold 6 { a32 g } }
}

openingRH = \relative g'' {
  \clef treble
  \global
  g1 \trill \f ~
  % \gTrill |
  g16 d16 es32 d c16 d16 g c,32 bes a16 bes g' c,32 bes a16 bes16 g' a,32 g fis16 \noBreak |
  g8
}

openingLHTopBeginning = \relative g {
  \once \override TextScript.color = #red
%  bes16-\markup {\postscript #(ps-rect 5 -1 12 43 0.25) } 
  bes16 \pp
    d c es bes d a c 
    bes16 d c es bes d a c \noBreak |
  bes8
}

openingLHTopContinuation = \relative bes {
  c bes es d es d c
  bes8
}

openingLHBottomBeginning = \relative g {
  \repeat unfold 8 { g8 \pp }
}

openingLHBottomContinuation = \relative g {
  g1 ~ g8
}

openingLH = {
  \clef bass
  \global

  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/8)
  \set Timing.beatStructure = #'(2 2 2 2)
  <<
    {
      \openingLHTopBeginning
      \openingLHTopContinuation
    }
    \\
    {
      \openingLHBottomBeginning
      \openingLHBottomContinuation
    }
  >>
}


\book {
  \paper {
    #(set-paper-size "size 8-2")
    indent = 0 \in
    ragged-right = ##t
  }
  \score {
    \new GrandStaff <<
      \new Staff \with { midiInstrument = "acoustic grand" } \openingRH
      \new Staff \with { midiInstrument = "acoustic grand" } \openingLH
    >>
    \layout {
      \context {
        \Staff
        \override DynamicText #'transparent = ##t
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 1.5-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative d'' { \global d16 g c,32 bes a16  }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 3-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative d'' {
      \global
      \partial 2.
      d16 g c,32 bes a16
      bes g' c,32 bes a16
      bes g' a,32 g fis16
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4 = 40
    }
  }
}


\book {
  \paper {
    #(set-paper-size "size 3-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative bes, {
      \clef bass
      \global
      \partial 2.
      d16 bes es32 f g16
      f bes, g'32 aes bes16
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 2-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative f'' {
      \clef treble
      \global
      f16 g32 f es f d16 es4
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}


\book {
  \paper {
    #(set-paper-size "size 6.5-1")
    indent = 0 \in
  }
  \score {
    \new Staff \relative f'' {
      \clef treble
      \global
      <<
        { f16 g32 f es f d16 es4 ~ es16 f32 es d es c16 d4 }
        \\
        {
          g,4 ~ g16 c32 bes aes bes c16 f,4 ~ f16 bes32 aes g aes bes16
          es,4
        }
      >>
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}


\book {
  \paper {
    #(set-paper-size "size 1-0.5")
    indent = 0 \in
    left-margin = 0.1 \in
  }
  \score {
    \new Staff \with { midiInstrument = #"woodblock" } \relative a' {
      \partial 2...
      \stopStaff
      \stemUp
      f32 f f f f16
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
        \remove Clef_engraver
      }
    }
    \midi {
      \tempo 4 = 56
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 6-1")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g'' {
      \global
      \once \override TextScript #'color = #red
      g1-\markup { \postscript #(ps-rect 8.5 -1 5 9 0.25) } \trill ~
      g16 d16 es32 d c16 d16 g c,32 bes a16 bes g' c,32 bes a16 bes16 g' a,32 g fis16 \noBreak |
      g8
    }
    \layout {}
  }
}


\book {
  \paper {
    #(set-paper-size "size 6-1")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g'' {
      \global
      g1 \trill ~
      g16 d16 es32 d c16 
        \once \override TextScript #'color = #red
        d16-\markup { \postscript #(ps-rect 7 -1 9 13.25 0.25) } 
        g c,32 bes a16 
        \once \override TextScript #'color = #blue
        bes-\markup { \postscript #(ps-rect 7.75 -0.5 9 13 0.25) } 
        g' c,32 bes a16 
        \once \override TextScript #'color = #darkmagenta
        bes-\markup { \postscript #(ps-rect 7.75 -0.5 9.75 13.75 0.25) }  
                                      g' a,32 g fis16 \noBreak |
      g8
    }
    \layout {}
  }
}
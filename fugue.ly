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

firstVoice = \relative g' {
  R1
  r2 r8 g bes d, |
  cis4 d r8 e16 f g8 f16 e |
  f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
  c4 bes a8 d16 c! bes8 c16 d |
  es8 c a fis' g4 g\rest |
  d8\rest e, a f d4 cis8 e ~ |
  e d g4 ~ g16 fis g a bes4 ~ |
  bes a ~ a16 d, e fis g4 ~ |
  g8 fis16 g a8 g16 fis g4. c8 |
  a8 bes16 c d2 c4 |
  bes4
}

secondVoice = \relative d' {
  c8\rest d es
  \change Staff = "down"
  \stemUp g, fis4 g |
  a8\rest a16 bes c8 bes16 a bes4 g
  a8\rest a16 g f8 g16 a bes8 g e
  \change Staff = "up" \stemDown cis' |
  d4. e8 f e! f g |
  a8 g16 fis g8 cis, d a'4 g16 fis |
  g4 fis8 a d4 f,\rest
}

thirdVoice = \relative g {
  \override MultiMeasureRest.staff-position = #0
  R1 * 3
  \revert MultiMeasureRest.staff-position
  R1 * 2
  r2 r8 g bes d, |
  cis4 d r8 e16 f g8 f16 e |
  f8 g16 a bes8 a16 g a8 bes16 c \change Staff = "up" \stemDown d8 c16 bes |
  c2. bes8 es!
  \change Staff = "down"
  \stemUp
  a,16 bes a bes c8 bes16 a bes8 \change Staff = "up" \stemDown c16 d \tieDown es4 ~ |
  es \tieNeutral d c2 |
  d4 a4\rest \change Staff = "down"
  %     a8\rest \stemUp f16 es d8 es16 f |
  %     g
}

fourthVoice = \relative d {
  \override MultiMeasureRest.staff-position = #-2
  R1 * 4
  bes8\rest d es g, fis4 g |
  r8 a16 bes c8 bes16 a bes4 g
  r8 a16 g f8 g16 a bes8 g e cis' |
  d1 |
  e8 a16 g fis8 g16 a bes,8 c16 d es8 d16 c |
  d2 g,4. a8 |
  bes f' g d es d16 es f8 f, |
  bes4
}

rightHand = {
  \global
  <<
    \firstVoice
    \\
    \secondVoice
  >>
}

leftHand = \relative d {
  \clef bass
  \global
  <<
    \thirdVoice
    \\
    \fourthVoice
  >>
}

\book {
  \paper {
    #(set-paper-size "letter")
  }
  \score {
    \new PianoStaff <<
      \new Staff = "up"
      \with { midiInstrument = #"harpsichord" }
      \rightHand
      \new Staff = "down"
      \with { midiInstrument = #"harpsichord" }
      \leftHand
    >>
    \layout { }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 4-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    {
      \relative d' {
        \clef bass
        \global
        r8 d es g, fis4 g |
        r8 a16 bes c8 bes16 a bes4 g
      }
    }
    \layout { }
    \midi { \tempo 4 = 80 }
  }
}


\book {
  \paper {
    #(set-paper-size "size 6-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" } {
      \relative g' {
        \global
        \partial 2
        r8 g bes d, |
        cis4 d r8 e16 f g8 f16 e |
        f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
        c8
      }
    }
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
      }
    }
    \midi { \tempo 4 = 80 }
  }
}


\book {
  \paper {
    #(set-paper-size "size 4-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" } {
      \relative d {
        \clef bass
        \global
        r8 d es g, fis4 g  |
        r8 a16 bes c8 bes16 a bes4 g |
      }
    }
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
      }
    }
    \midi { \tempo 4 = 80 }
  }
}


\book {
  \paper {
    #(set-paper-size "size 6-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    {
      \relative g {
        \clef bass
        \global
        \partial 2
        r8 g bes d, |
        cis4 d r8 e16 f g8 f16 e |
        f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
        c8
      }
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}

buildAFugueSoprano = \relative g' {
  \global
  R1
  r2 r8 g bes d, |
  cis4 d r8 e16 f g8 f16 e |
  f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
  c4
}

buildAFugueAlto = \relative d' {
  \clef alto
  \global
  r8 d es g, fis4 g |
  r8 a16 bes c8 bes16 a bes4 g
}

buildAFugueTenor = \relative g {
  \clef tenor
  \global
  R1 * 5
  r2 r8 g bes d, |
  cis4 d r8 e16 f g8 f16 e |
  f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes c2.
}

buildAFugueBass = \relative d {
  \clef bass
  \global
  R1 * 4
  r8 d es g, fis4 g |
  r8 a16 bes c8 bes16 a bes4 g
}

\book {
  \paper {
    #(set-paper-size "size 8.5-11")
    indent = 0 \in
  }
  \score {
    \new StaffGroup <<
      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \buildAFugueSoprano
      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \buildAFugueAlto
      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \buildAFugueTenor
      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \buildAFugueBass
    >>
    \layout {}
    \midi { \tempo 4 = 80}
  }
}

\book {
  \paper {
    #(set-paper-size "size 8.5-3")
    indent = 0 \in
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \relative g' {
        \global
        R1
        r2 r8 g bes d, |
        cis4 d r8 e16 f g8 f16 e |
        f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
        c4
      }

      \new Staff
      \with { midiInstrument = #"harpsichord" }
      \relative d' {
        \clef bass
        \global
        r8 d es g, fis4 g |
        r8 a16 bes c8 bes16 a bes4 g |
        r8 a16 g f8 g16 a bes8 g e cis' |
        \clef treble
        d4. e8 f e f g |
        a8
      }
    >>
    \layout {
      clip-regions
      = #(list
          (cons
           (make-rhythmic-location 0 0 0)
           (make-rhythmic-location 5 4 1)))
    }
    \midi { \tempo 4 = 80}
  }
}

\book {
  \paper {
    #(set-paper-size "size 2-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    \relative a
    {
      \clef bass
      \global
      r8 a16 bes c8 bes16 a bes4
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 2-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    \relative a
    {
      \clef bass
      \global
      r8 a16 g f8 g16 a bes8
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 2-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    \relative e'
    { \global s2 r8 e16 f g8 f16 e f8 }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 5-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    \relative e'
    {
      \global
      s2 r8 e16 f g8 f16 e |
      f8 g16 a bes8 a16 g a8 bes16 c d8 c16 bes |
      c4
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 1.75-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff 
      \with { midiInstrument = #"harpsichord" }
      \relative a {
      \clef bass
      \global
      r8 a16 b c8 bes16 a bes4
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80}
  }
}

\book {
  \paper {
    #(set-paper-size "size 1.75-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff 
      \with { midiInstrument = #"harpsichord" }
      \relative a {
      \clef bass
      \global
      r8 a16 g f8 g16 a bes8
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4 = 80 }
  }
}                   

\book {
  \paper {
    #(set-paper-size "size 4-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" }
    {
      \relative d' {
        \clef bass
        \global
        r8 d es g, fis4 g |
        \override TextScript #'color = #red
        r8 a16-\markup { \postscript #(ps-rect 7 -1 8 15 0.25) }
           bes c8 bes16 a bes4 g
      }
    }
    \layout { }
    \midi { \tempo 4 = 80 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 6-0.75")
    indent = 0 \in
  }
  \score {
    \new Staff
    \with { midiInstrument = #"harpsichord" } {
      \relative g' {
        \global
        \partial 2
        r8 g bes d, |
        \override TextScript #'color = #red
        cis4 d r8 e16-\markup { \postscript #(ps-rect 7 -1.5 8 16.5 0.25) } 
          \override TextScript #'color = #blue
          f-\markup { \postscript #(ps-rect 6.5 10 6.5 17.5 0.25) }  g8 f16 e |
        f8 g16 a bes8 a16 g 
          \override TextScript #'color = #darkcyan
          a8-\markup { \postscript #(ps-rect 6.5 -0.5 6.5 18 0.25) } 
          bes16 c d8 c16 bes |
        c8
      }
    }
    \layout {
      \context {
        \Staff
        \remove "Time_signature_engraver"
      }
    }
    \midi { \tempo 4 = 80 }
  }
}
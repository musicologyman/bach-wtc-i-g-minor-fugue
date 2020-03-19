\version "2.18.2"

\include "../lilypond-page-sizes/paper-sizes.ily"

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

  %measure 5
  c4 bes a8 d16 c! bes8 c16 d |
  es8 c a fis' g4 g\rest |
  d8\rest e, a f d4 cis8 e ~ |
  e d g4 ~ g16 fis g a bes4 ~ |
  bes a ~ a16 d, e fis g4 ~ |

  %measure 10
  g8 fis16 g a8 g16 fis g4.
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
  a,16 bes a bes c8 bes16 a bes8 
}

fourthVoice = \relative d {
  \override MultiMeasureRest.staff-position = #-2
  R1 * 4
  bes8\rest d es g, fis4 g |
  r8 a16 bes c8 bes16 a bes4 g
  r8 a16 g f8 g16 a bes8 g e cis' |
  d1 |
  e8 a16 g fis8 g16 a bes,8 c16 d es8 d16 c |
  d2 g,4. 
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


// @title rie tanaka - ningyo hime (terry fail rework)
// @by terry fail
// @details v0.0.2
//
samples('github:tidalcycles/dirt-samples')
setcpm(70/4)

let chords = `[
  [Em C D D C B B]
  [Em A D D G C Bm A]
  [Em C D G C C B B]
  [Em A D G C Bm]
  [C7 G C7 G]
]/16`

let ld_n = "[71 [78 ~] 71 ~]"
let gu_n = "<[<1,2,3>*4 <0,1,2>*4 <1,2,3>*4]*4>/2, 4*2 1*6"
// let gu_n = "<[<1,2,3>*4 <1,2,0>*4 <1,2,3>*4]*4>/2, 4*2 0*6"

gu: n(gu_n).chord(chords)
  .voicing().s("gm_acoustic_guitar_nylon").vib(.05)
  .rel(1).mode("duck").delay(.3)
// ld: note(ld_n).delay(".7:.25")

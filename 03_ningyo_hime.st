// @title rie tanaka - ningyo hime (terry fail rework)
// @by terry fail
// @details v0.0.5
//
samples('github:tidalcycles/dirt-samples')
setcpm(48/4)

let gt_ch = `[
  [Em C D C C B B]
  [Em A D D G C Bm A]
  [Em C D G C C B B]
  [Em Em A D G C Bm]
  [C7 G C7 G]*2
]/16`
let gt_n = "<[<1,2,3>*4 <0,1,2>*4 <1,2,3,4>*4 <1,2,3>*4]*4>/2"
let gt_s = "gm_acoustic_guitar_nylon:[0|0|0|2|5]*8"

gt: n(gt_n).chord(gt_ch).voicing().s(gt_s)
  .adsr(".01:1:1:1")
  .vib(.05)
  .delay(".6 .8 .9").lpf("1500|1800|2000|2100")
  .room(".3:4")
  .juxBy("<.2 .3 .4>", press)
  .sometimesBy(.1, late(.025))
  .sometimesBy(.1, early(.025))
  .gain(.8)

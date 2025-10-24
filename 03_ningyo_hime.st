// @title rie tanaka - ningyo hime (terry fail rework)
// @by terry fail
// @details v0.1.3
//
samples('github:tidalcycles/dirt-samples')
setcpm(48/4)

let gt_ch = `[
  [Em C D C C B B]
  [Em A D D G C Bm A A]
  [Em C D G C B B]
  [Em A D G C Bm]
  [C7 G C7 G]*2
]/16`
let gt_s = "gm_acoustic_guitar_nylon:[0|0|0|2|5]*8"
let gtb_n = "[<1,2,3>*3 <0,1,2>*4 <1,2,3,4>*4 <1,2,3>*4]"
let gtb_lpf = "[1200 1300 1400 1500 1600 1700 2000]/2"
let gtf_n = "1 2 1 3 1 2 1 3 1 2 1 3 1 2 1 3"

gtb: n(gtb_n).chord(gt_ch).voicing().s(gt_s)
  .adsr(".01:1:1:1")
  .vib(.2)
  .delay(.75).lpf(gtb_lpf)
  .room(".2:4")
  .gain(.65)
  .juxBy("<.2 .3 .4>", press)
  .compressor("-10:3:10:.005:.02")

gtf: n(gtf_n).chord(gt_ch.rev()).voicing().s(gt_s)
  .adsr(".01:1:1:1")
  .gain(".35 .4 .45").delay(.75)
  .room(".2:4")
  .vib(.2)

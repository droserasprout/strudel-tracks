// @title rie tanaka - ningyo hime (terry fail rework)
// @by terry fail
// @details v0.1.7
//
samples('github:tidalcycles/dirt-samples')
setcpm(48/4)

let gt_ch = `[
  [Em C [D C] C C B B]
  [Em A D [D G] G [C Bm] Bm Bm]
  [Em C [D G] G C [C B] B B]
  [Em A D [D G] G [C Bm] Bm Bm]
  [C7 G]*4
]/16`
let gt_s = "gm_acoustic_guitar_nylon:[0|0|0|2|5]*8"
let gtb_n = "[<1,2,3>*3 <0,1,2>*4 <1,2,4>*4 <0,2,3>*4]"
let gtb_lpf = "[1200 1300 1400 1500 1600 1700 2000]/2"
let gtf_n = "[1 2 1 3] [1*2 2 1 3] [1 2 1*2 3] [~ [1 2 1] ~ [1 2 1]]"
let gt_base = x => x.voicing().s(gt_s).adsr(".01:1:1:1").vib(.175).delay(.75)

gtb: n(gtb_n).chord(gt_ch).always(gt_base)
  .room(".2:4").gain("[.60 .65 .65 .68]/2")
  .lpf(gtb_lpf).juxBy("<.2 .3 .4>", press)
  .compressor("-10:4:5:.005:.03")

gtf: n(gtf_n).chord(gt_ch.rev()).always(gt_base)
  .room(".3:5").gain(".35 .40 .45")
  .compressor("-5:1.5:5:.005:.01")
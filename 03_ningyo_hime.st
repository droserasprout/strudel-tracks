// @title rie tanaka - ningyo hime (terry fail rework)
// @by terry fail
// @details v0.1.1
//
samples('github:tidalcycles/dirt-samples')
setcpm(48/4)

const _rng = (c, a, b, s, seg=8) => (
  r => s > 0 ? r.fast(s) : r.slow(-s)
)(c.segment(seg).range(a, b))

let gt_ch = `[
  [Em C D C C B B]
  [Em A D D G C Bm A]
  [Em C D G C C B B]
  [Em Em A D G C Bm]
  [C7 G C7 G]*2
]/16`
let gt_n = "<[<1,2,3>*3 <0,1,2>*4 <1,2,3,4>*4 <1,2,3>*4]*4>/2"
let gt_s = "gm_acoustic_guitar_nylon:[0|0|0|2|5]*8"
let gt_lpf = _rng(saw, 1200, 2000, 2, 8)
let hh_lpf = _rng(saw, 4000, 4500, 2, 8)

hh: s("hh:1 hh:1 hh:1 oh:3").bank("ry30")
  .delay(".75:.1:.5")
  .duckorbit(1).duckdepth(.1).duckatt(.2)
  .gain(.02).room(.5)
  .lpf(hh_lpf).adsr(".02:1:1:1").speed("[.6|.7]*2")
gt: n(gt_n).chord(gt_ch).voicing().s(gt_s)
  .orbit(1)
  .adsr(".01:1:1:1")
  .vib(.1)
  .delay(.7).lpf(gt_lpf)
  .room(".2:4")
  .gain(.6)
  .juxBy("<.2 .3 .4 .5>", press)
  .compressor("-10:3:10:.005:.02")

// @title kelly bailey - triage at dawn (terry fail rework)
// @by terry fail
// @details v0.1.10
//
samples('github:tidalcycles/dirt-samples')
setcpm(80/4)

// let bd_s = "bd bd bd:1 [bd ~ bd:1 ~ bd*3]"
let bd_s = "[bd]*<16 16 8 16 16 8 [16 32] 8 8>"
let hh_s = "hh:2 hh:3 hh:4 [hh:2]*2"
let hh_lpf = "<3500 3750 4000>"
let hh_slice = "[<0 2> <0 1> <0 3*2> 0 [3*2] [1~1] 0 1]*2"
let ld_n = "[c6 ~ ~ a5 ~ ~ c6 ~ b5 ~ ~ g5 ~ ~ a5 ~ e5 ~ ~ d5 ~ ~ c5 ~ e5 ~ ~ d5 ~ ~ e5 ~]/4"
let pd_n = "[[e4,a4,e5] [d5,d4,g4] [a4,d4,a3] [a4,d4,a3]]/4"
let bs_n = "[a2 a3]/4"
let fm_n = "[10*2 10, 8, 12/2]*2, 10/2"

let bd_gain = slider(0.9, 0, 1, .05)
let ld_gain = slider(1, 0, 1, .05)

let fm_gain = slider(0.7, 0, 1, .05)
let fm_delay = slider(0.5, 0, 1, .05)
// let fm_speed = slider(1, 0, 1, .05)
let fm_speed = "<.25 .25 .5 .5 .25 .25 .5 .55 .25 .25 .5 .5 .64 .58 .50 .55>"
let fm_lpf = "[20000|15000|10000|3000|1500|1000]"

bd: s(bd_s).bank("ry30")
  .adsr(".003:1:1:.9")
  .distort(.5).delay(.25).lpf("6100:.8")
  .duckorbit(1).duckdepth(.1).duckatt(.2)
  .sometimesBy(.15, ply(2))
  .gain(bd_gain)
hh: s(hh_s).bank("ry30")
  .adsr("0:0:.8:0")
  .slice(4, hh_slice.every(4, rev))
  .duckorbit(2).duckdepth(.2).duckatt(.5)
  .distort(.6).delay(.5).lpf(hh_lpf)

ld1: note(ld_n).s("piano")
  .adsr(".1:0:1:.5")
  .distort(1).delay(.8).dt(.1).juxby(.5, rev)
  .pan(.55).gain(ld_gain)
  .room(".5:4")
  .ph(8).crush(16)
  .sometimesBy(.3, ply(2))
  .delay(".5:.5")
  .someCyclesBy(.2, x => x.slow("2"))
ld2: note(ld_n).s("piano1")
  .adsr(".1:0:1:1")
  .distort(1).delay(.6)
  .juxBy(.5, rev)
  .pan(.45).gain(mul(ld_gain, .95))
  .delay(".5:.5")
  .room(".8:7")
  .late(.25).lpf("2500:.9").ph(4)
  .sometimesBy(.2, ply(3))

pd: note(pd_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".6:6").vib(.02).orbit(1)
bs: note(bs_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".5:5").vib(.01).orbit(2)

fm1: n(fm_n).s("fm/2").slow(4)
  .adsr(".1:1:1:1")
  .delay(fm_delay)
  .speed(fm_speed).irspeed(.25)
  .crush(5)
  .gain(mul(fm_gain, 1))
  .orbit(1).pan(.45)
  .room(".7:6")
  .lpf(fm_lpf)
fm2: n(fm_n).s("fm").late(.5)
  .adsr(".1:1:1:.5")
  .delay(fm_delay)
  .crush(5)
  .speed(mul(fm_speed, 2))
  .gain(mul(fm_gain, .75))
  .orbit(2).pan(.55)
  .lpf(fm_lpf)
  .room(".7:7")

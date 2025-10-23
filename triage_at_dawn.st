// @title kelly bailey - triage at dawn (terry fail rework)
// @by terry fail
// @details v0.1.2
//
samples('github:tidalcycles/dirt-samples')
setcpm(80/4)

let ld_n = "[c6 ~ ~ a5 ~ ~ c6 ~ b5 ~ ~ g5 ~ ~ a5 ~ e5 ~ ~ d5 ~ ~ c5 ~ e5 ~ ~ d5 ~ ~ e5 ~]/4"
let pd_n = "[[e4,a4,e5] [d5,d4,g4] [a4,d4,a3] [a4,d4,a3]]/4"
let bs_n = "[a2 a3]/4"
let fm1_n = "[10*2 10, 8, 12]*2 10/2"
let fm2_n = "[10*2 10, 9, 12]*2 10/2"
let bd_s = "[bd]*16"
let hh_s = "hh:2 hh:3 hh:4 [hh:2]*2"
let hh_lpf = "<3500 3750 4000>"
let hh_slice = "[<0 2> <0 1> <0 3*2> 0 [4*2] [1~1] 0 1]*2"

bd: s(bd_s).bank("ry30")
  .adsr(".003:1:1:.9")
  .distort(.5).delay(.25).lpf(6200)
  .duckorbit(1).duckdepth(.1).duckatt(.2)
hh: s(hh_s).bank("ry30")
  .adsr("0:0:.8:0")
  .slice(4, hh_slice.every(4, rev))
  .duckorbit(2).duckdepth(.2).duckatt(.5)
  .distort(.6).delay(.5).lpf(hh_lpf)
ld1: note(ld_n).s("piano")
  .adsr(".1:0:1:.5")
  .distort(1).delay(.6).dt(.1).juxby(.5, rev)
  .pan(.55)
  .room(.5).rsize(3)
  .ph(8).crush(16)
ld2: note(ld_n).s("piano1")
  .adsr(".005:0:1:.5")
  .distort(1).delay(.6)
  .juxBy(.5, rev)
  .pan(.45)
  .room(.8).rsize(8)
  .late(.25).lpf(3300).lpe(.5).ph(4)
pd: note(pd_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".6:6").vib(.02).orbit(1)
bs: note(bs_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".5:5").vib(.01).orbit(2)
fm1: n(fm1_n).s("fm/2").slow(4)
  .speed(.5).irspeed(.25).rel(.25)
  .crush(8).att(.1)
  .gain(.5).orbit(1).pan(.45)
  .room(".6:3")
fm2: n(fm2_n).s("fm").late(.5)
  .crush(5).att(.05)
  .gain(.6).orbit(2).pan(.55)
  .room(".6:3")

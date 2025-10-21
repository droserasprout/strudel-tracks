// @title triage at dawn (rework)
// @by terry fail
// @by kelly bailey
samples('github:tidalcycles/dirt-samples')

setcpm(80/4)

let ld_n = "[c6 ~ ~ a5 ~ ~ c6 ~ b5 ~ ~ g5 ~ ~ a5 ~ e5 ~ ~ d5 ~ ~ c5 ~ e5 ~ ~ d5 ~ ~ e5 ~]/4"
let pd_n = "[[e4,a4,e5] [d5,d4,g4] [a4,d4,a3] [a4,d4,a3]]/4"
let bs_n = "[a2 a3]/4"
let fm_n = "[10*2 10, 8 9, 12]*2 10/2"
let bd_s = "[bd]*16"
let hh_s = "hh:2 hh:3 hh:4 hh2"
let hh_slice = "[[0,2] [0,1] <0 3*2> [0,2] [3,4*2] [1~1] 0 1]*2"

bd: s(bd_s).bank("ry30")
  .distort(.8).delay(.25).lpf("<6200 6500 6800>/2").room(.1).rsize(1)
  .duckorbit(1).duckdepth(.25).duckatt(.2).gain("<.75 .7 .6 .5 .5 .55 .6 .7>")
hh: s(hh_s).bank("ry30")
  .duckorbit(2).duckdepth(.33).duckatt(.5)
  .distort(.6).delay(.5).lpf("<3500 3750 4000>").room(.3).rsize(5).gain(.9)
  .slice(4, hh_slice.every(4, rev))
  .sometimesBy(.33, ply(2))
ld1: note(ld_n).s("piano")
  .distort(.8).delay(.5).dt(.1).juxby(0.2, rev)
  .pan(.6).orbit(1).room(.1).rsize(5).att(.01).gain(1.2)
ld2: note(ld_n).s("piano1")
  .distort(1).delay(.5).jux(rev)
  .pan(.4).orbit(2).room(.8).rsize(8)
  .late(.25).lpf(2400).gain(1.1)
pd: note(pd_n).s("sine").room(.8).vib(.02)
bs: note(bs_n).s("sine").room(.5).vib(.01)
fm1: n(fm_n).s("fm/2").slow(4).crush(8)
  .speed(.5).irspeed(.25).att(.1).ir("fm:10")
  .delay(.5).dt(.5).delayfb(.15).gain(.5).orbit(1).pan(.45).room(.5)
fm2: n(fm_n).s("fm").late(.5).crush(5)
  .delay(.4).dt(.5).delayfb(.15).gain(.5).orbit(2).pan(.55)

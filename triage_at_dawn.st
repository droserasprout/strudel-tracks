// @title triage at dawn (terry fail rework)
// @by kelly bailey
//
samples('github:tidalcycles/dirt-samples')

setcpm(80/4)

let ld_n = "[c6 ~ ~ a5 ~ ~ c6 ~ b5 ~ ~ g5 ~ ~ a5 ~ e5 ~ ~ d5 ~ ~ c5 ~ e5 ~ ~ d5 ~ ~ e5 ~]/4"
let pd_n = "[[e4,a4,e5] [d5,d4,g4] [a4,d4,a3] [a4,d4,a3]]/4"
let bs_n = "[a2 a3]/4"
let fm_n = "10*2 10, 8 9, 12" 
let bd_s = "[bd]*16, ~ hh:2 ~ hh:3"

bd: s(bd_s).bank("ry30").distort(1).delay(.1).lpf(4500).room(.1).rsize(1)
  .duckorbit(1).duckdepth(.2).duckatt(.2)
  .duckorbit(2).duckdepth(.2).duckatt(.1)
ld: note(ld_n).s("piano").distort(.8).delay(.33).juxby(0.1, rev).pan(-.1).orbit(1).room(.1).rsize(5)
ld2: note(ld_n).s("piano1").distort(1).delay(.4).juxby(0.2, rev).pan(.1).orbit(2).room(.9).rsize(5).late(.25).lpf(5000)
pd: note(pd_n).s("sine")
bs: note(bs_n).s("sine")
fm: n(fm_n).s("fm/2").slow(4).crush("6")
  .speed(.5)
  .irspeed(.25).att(.1).ir("fm:10")
  .delay(.9).delayfb(1).gain(.75)

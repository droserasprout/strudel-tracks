// @title kelly bailey - triage at dawn (terry fail rework)
// @by terry fail
// @details v0.1.15
//
samples('github:tidalcycles/dirt-samples')
setcpm(80/4)

let bd_s = "[bd]*<16 16 8 16 16 8 [16 32] 8 8>"
let hh_s = "hh:2 hh:3 hh:4 [hh:2]*2"
let hh_lpf = "<3500 3750 4000>"
let hh_slice = "[<0 2> <0 1> <0 3*2> 0 3*2 [1~1] 0 1]*2"
let ld_n = "[c6 ~ ~ a5 ~ ~ c6 ~ b5 ~ ~ g5 ~ ~ a5 ~ e5 ~ ~ d5 ~ ~ c5 ~ e5 ~ ~ d5 ~ ~ e5 ~]/4"
let sn_h_n = "[[e4,a4,e5] [d5,d4,g4] [a4,d4,a3] [a4,d4,a3]]/4"
let sn_l_n = "[a2 a3]/4"
let fm_n = "[10*2 10, 8, 12/2]*2, 10/2"

// let bd_gain = slider(0)
// let hh_gain = slider(0)
// let ld_gain = slider(0)
// let fm_gain = slider(0)
// let s_gain = slider(0)
let bd_gain = "[.00 .00 .45 .55 .50 .55 .55 .00]/48"
let hh_gain = "[.75 .55 .60 .60 .30 .50 .50 .60]/48"
let ld_gain = "[.10 .35 .40 .60 .70 .50 .60 .70]/48"
let fm_gain = "[.00 .20 .40 .50 .40 .30 .15 .00]/48"
let sn_gain = "[.60 .60 .50 .50 .40 .20 .40 .60]/48"

// let fm_delay = slider(0)
// let fm_speed = slider(0)
// let fm_lpf = slider(0, 0, 20000)
let fm_delay = "<.2 .5 .75 1>/4"
let fm_speed = "<.25 .25 .5 .5 .25 .25 .5 .55 .25 .25 .5 .5 .64 .58 .50 .55>"
let fm_lpf = "[20000|15000|8000|3000|1500|1000]/2"

bd: s(bd_s).bank("ry30")
  .adsr(".002:1:1:.8")
  .distort(.5).delay(.25).lpf("5500:3")
  .duckorbit(1).duckdepth(.2).duckatt(.25)
  .sometimesBy(.15, ply(2))
  .gain(bd_gain)
  .someCyclesBy(.2, x => x.hpf("180"))
  .someCyclesBy(.1, x => x.gain(".3"))
hh: s(hh_s).bank("ry30")
  .adsr("0:0:.8:0")
  .slice(4, hh_slice.every(4, rev))
  .duckorbit(2).duckdepth(.2).duckatt(.5)
  .distort(.6).delay(".5:.5:.04").lpf(hh_lpf)
  .gain(hh_gain)

ld_l: note(ld_n).s("piano")
  .adsr(".1:0:1:.5")
  .distort(1).delay(.8).dt(.1)
  .juxby(.6, rev)
  .pan(.55).gain(ld_gain)
  .room(".5:5")
  .ph(8).crush(16)
  .sometimesBy(.3, ply(2))
  .delay(".5:.5")
  .someCyclesBy(.2, x => x.slow("2"))
ld_h: note(ld_n).s("piano1")
  .adsr(".1:.3:1:1")
  .distort(1).delay(.6)
  .juxBy(.6, rev)
  .pan(.45).gain(ld_gain)
  .delay(".5:.5")
  .room(".7:5")
  .late(.25).lpf("2250").ph(8)
  .sometimesBy(.2, ply(3))

sn_h: note(sn_h_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".6:6").vib(.02).orbit(1)
  .pan(.45)
  .gain(mul(sn_gain, .8))
sn_l: note(sn_l_n).s("sine")
  .adsr(".3:1:1:.3")
  .room(".5:5").vib(.01).orbit(2)
  .pan(.55)
  .gain(mul(sn_gain, .8))


fm_l: n(fm_n).s("fm/2").slow(4)
  .adsr(".2:1:1:1")
  .delay(fm_delay)
  .speed(fm_speed).irspeed(.25)
  .crush(5)
  .gain(mul(fm_gain, .8))
  .orbit(1).pan(.45)
  .room(".7:6")
  .lpf(fm_lpf)
fm_h: n(fm_n).s("fm").late(.5)
  .adsr(".3:1:1:.5")
  .delay(fm_delay)
  .crush(5)
  .speed(mul(fm_speed, 2))
  .gain(mul(fm_gain, .6))
  .orbit(2).pan(.55)
  .lpf(fm_lpf)
  .room(".7:7")

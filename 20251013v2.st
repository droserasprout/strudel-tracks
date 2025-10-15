// "20251013v2" @by terry fail
 
setcpm(125/4)

let sineran = (a, b) => sine.segment(16).range(a, b)
let sawran = (a, b) => saw.segment(16).range(a, b)
let sl0 = slider(0.6, 0, 1, .1)
let sl1 = slider(0.7, 0, 1, .1)

$0: s("bd:2 bd:1 bd:3 bd:4").bank("ry30")
  .bite(4, "1 0 [1 4] <2 4> 0 [2 3] [2 1] 3").decay(.5)
  .duck(1).duckatt(.2).duckdepth(0.25)
  .duck(2).duckatt(.01).duckdepth(0.1)
  .delay(.3).dfb(.7)
  .lpf(sineran(800, 4000).slow(4))
  .gain(sineran(.6, .7).rev().mul(sl0))

$1: s("~ hh:0 ~ hh:1 ~ hh:2 ~ hh:1").bank("tr808")
  .att(0.005).dec(".4").distort(.2)
  .delay("<.25 .25 .25 .1>/2").dfb(.6)
  .lpf(sineran(800, 12000).slow(2).rev())
  .gain(sawran(.6, .7).mul(sl0)).orbit(2)
  .sometimesBy(.2, x => x.dt(".5").slow(2))

$2: n(sawran(0, 25)).scale("C3:minor").s("gm_shamisen")
  .ph(8).phc(2500).room(.4)
  .lpf(8000).att(0.007)
  .gain(sawran(.8, .9).slow(2).rev().mul(sl1)).orbit(2)
  .sometimesBy(.3, x=> x.slow(2).clip(".5"))

$3: note("[eb,g,bb,d]").s("gm_flute")
  .att(.5).rel(1)
  .lpf(sineran(2800, 6000).fast(4))
  .gain(sawran(.4, .7).rev().mul(sl1)).orbit(1)
  .room(sineran(.3, .5)).rsize(3)
  .someCyclesBy(.4, scale("<D:minor Db2:minor Eb:minor>"))
  .chorus(.2).dist(.4).vib(.2)

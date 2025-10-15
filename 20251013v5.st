// "20251013v5" @by terry fail

setcpm(125/4)
const _rng = (c, a, b, s) => (
  r => s > 0 ? r.fast(s) : r.slow(-s)
)(c.segment(16).range(a, b))
const bd_bites = [
  "<3 0*2> ~ ~ ~",
  "0 3 <2 3> 1, ~ 1 ~ 2",
  "1 0 [1 4] <2 4> 0 [2 3] [2 1] 3",
]
const sl0 = slider(0.9, 0, 1, 0.1)
const sl1 = slider(0.9, 0, 1, 0.1)
const sl2 = slider(1, 0, 2, 1)


bd: s("bd:2 bd:1 bd:3 bd:4").bank("ry30")
  .bite(4, pick(bd_bites, sl2))
  .duckorbit(1).duckattack(.2).duckdepth(.2)
  .duckorbit(2).duckattack(.4).duckdepth(.1)
  .delay("<.4 .5>/2").dfb(.6)
  .dec(_rng(perlin, .4, .6, 1))
  .lpf(_rng(sine, 800, 4500, -4).rev())
  .gain(_rng(sine, .55, .65, 1).rev().mul(sl0))
  .att(0.01).pan(_rng(saw, .4, .6, 1).rev())

hh: s("~ hh:0 ~ hh:1 ~ hh:2 ~ hh:1").bank("tr808")
  .att(0.01).dec(.5).distort(.2).pan(_rng(saw, .4, .6, 1))
  .delay("<.25 .25 .1 .5>/2").dfb(.6)
  .lpf(_rng(sine, 4000, 8500, -4))
  .gain(_rng(sine, .5, .7, -2).mul(sl0))
  .sometimesBy(.2, x => x.dt(".25").fast("2"))
  .someCyclesBy(.2, x => x.slow("2"))

fl: note("[eb,g,bb,d],[~ ~ ~ <d4 g4>/3]/4").s("gm_flute")
  .att(.55).rel(1)
  .lpf(_rng(sine, 330, 2400, -16))
  .gain(_rng(saw, .3, .4, -2).rev().mul(sl1))
  .room(_rng(saw, .3, .6, -4)).rsize(5)
  .someCyclesBy(.3, scale("<D:minor Db:minor Eb:minor>"))
  .chorus(.2).dist(.5).vib(.25).orbit(2)
  .juxBy(.2, rev)

sh: n(_rng(saw, 0, 25, 1)).scale("C3:minor").s("gm_shamisen")
  .ph(4).phc(2500).room(.5).lpf(8500).att(.007)
  .gain(_rng(saw, .8, 1, -2).rev().mul(sl1)).orbit(1)
  .someCyclesBy(.2, ply("1.25"))
  .sometimesBy(.3, x=> x.slow(2).clip(".6"))

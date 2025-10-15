// "dive" @by terry fail 
setcpm(125/4)

$: s("bd bd bd bd").bank("tr505")
  .duckorbit(2).duckattack(0.05).duckdepth(0.1).lpf(1500)
  .delay(.1)
  .room(.1).rsize(3)
  .gain(.7)

$drums1: s("bd bd, oh hh hh hh")
  .bank("tr505")
  .dec(.2).lpf(800).delay(.1)
  .sometimesBy(.2, ply("3"))
  .duckorbit(1).duckattack(0.2).duckdepth(0.1)
  .gain("[.3 .2]")

$drums2: s("bd hh hh*2 hh")
  .bank("tr909")
  .dec(.4).hpf(110).lpf("[3600|3600|3600|800]/8")
  .sometimesBy(.2, ply("4"))
  .sometimesBy(.5, ply("6"))
  .duckorbit(2).duckattack(0.2).duckdepth(0.15)
  .gain("[.3 .6]*4")

$space: note("[eb g,bb,d]*3 <[eb,g,bb,d] [g,bb,d]*2>")
  .s("sawtooth")
  .sometimesBy(.2, ply("2"))
  .sometimesBy(.2, add("e5*2"))
  .gain("[.3 | .5]/16")
  .lpf("<3000 3000 6000 <12500 2000>>")
  .fmh("<1.5 1.61 1.75>/4")
  .delay(".5 | .8 | .9 | 1")
  .orbit(2).room(.3).rsize(5)
  .phaser("16")

$synth: note("a d2*3 a2 a*2 d a, f/2 a/2")
  .s("sawtooth")
  .lpf("[12000 14000 14000 13000 6000 2000 2000 3000]/2")
  .fmi("[0|0|0|2|4]/4")
  .sometimesBy(.2, ply("2"))
  .distort(".3 | .3 | .3 | .6")
  .juxby(".7", rev)
  .orbit(2)
  .gain("[.6 | .5]/16")

$xylo: note("~|~|~|~|~|~| a*3 ~ ~ a*3 a | d/2 a*2 ~ ~ a*2")
  .s('gm_vibraphone').lpf(16000)
  .release(.5).delay(".8").room(.7).rsize(7)
  .distort(".5 | .3")
  .orbit(2)
  .gain("[.3 | .4]/16")

// when i grow up i want to be like Switch Angel 🥰
// had no idea algorave exists before discovering her insta
// "20251013" @by terry fail 
setcpm(125/4)

let p0 = "bd:2 bd:1 bd:3 bd:4"  
let p1 = "~ hh:0 ~ ~ hh:1 ~ hh:2 ~ rd:1"

let sl0 = slider(0.478)
let sl1 = slider(0.437)

$0: s(p0).bank("ry30")
  .bite(4, "1 0 [1 4] <2 4> 0 [2 3] [2 1] 3")
  .duck(1).duckatt(0.15).duckdepth(0.2)
  .delay(sl1.range(0, 0.5)).ds(".8")
  .lpf("<3000 500 3000 4200 4200 2400>/2")
  .gain("<.7 .6>".mul(sl0))
  .att(0.01)

$1: s(p1).bank("ry30")
  .bite(4, "0 3 0 [~ ~ 0 1 ~] [~ 1] [~ ~ 1 1 ~] 3 0")
  .att(0.005).dec(".4").distort(.4)
  .delay("<0 .1>/2").dfb(.1)
  .lpf(sl0.range(0, 2000))

$2: n(sine.segment(16).range(10,30)).scale("C3:minor")
  .ph(8).phc(2500).room(sl1.range(0.2, 0.5))
  .lpf(sl1.range(0, 8000)).gain(0.8).att(0.005)
  .sometimes(iter("16")).sometimes(iter("4"))

$3: note("[eb,g,bb,d]").s("sawtooth")
  .gain(.18).att(.3).rel(.3)
  .fmsustain("<1 .2 .5>/2")
  .delay("<.5 1>/2").orbit(1)
  .lpf("<3000 5800>/2".mul(sl1))
  .rarely(scale("<D:minor D:minor E:major>"))





















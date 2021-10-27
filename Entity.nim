import std/random
include Inventory 
type
  Entity = ref object of RootObj
    name: string
    level: int
    HP*: int
    MP: int
    inventory: Inventory 
    DPS: int

method defend(defender: Entity, attacker: Entity): int  =
  randomize()
  return rand(100)    

method attack(assailant: Entity, target: Entity): void =
  var targetHP = target.HP
  var damage = assailant.DPS - target.defend(assailant) #need to work difficulty into this after i figure out control flow/branching
  if damage < 0:
    damage = 0
  targetHP = targetHP - damage
  echo target.name," takes ",$(damage)," damage!"
  target.HP = targetHP 




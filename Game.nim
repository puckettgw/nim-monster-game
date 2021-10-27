include Entity
include Player
import Prelude
include World

method generateMobs(world: World): void =
  var moblist = MobList()
  for i in 1..(world.difficulty * 100):
    moblist.generateMob(world.difficulty)
  world.mobs = moblist
  
method kill_mob(player: Player, mob: Monster): void =
  echo $(mob.name)," was killed by ",$(player.name),"!"

method combat(mob: Monster, player: Player): void =
  while (mob.HP > 0 and player.HP > 0):
    echo $(player.name),"'s HP: ",$(player.HP),"\t\t",$(mob.name),"'s HP: ",$(mob.HP)
    echo """What do you want to do?
      a) Attack
      r) Run away"""
    case getch():
      of 'a':
        player.attack(mob)
        mob.attack(player) 
      of 'r':
        randomize()
        var runroll = rand(1..10)
        if runroll > 5:
          echo "You successfully run away."
        else:
          echo "You failed to run away!"
          mob.attack(player)
      else:
        continue
    if mob.HP < 1:
      player.kill_mob(mob)
    if player.HP == 0:
      echo "You died! Better luck next time..."
      break
  
var testfunc = """
proc test(): void =
  var victim = Entity(name:"Bob",level:10,HP:100,MP:100,inventory:Inventory(),DPS:100)
  var attacker = Entity(name:"Frank",level:10,HP:100,MP:100,inventory:Inventory(),DPS:150)

  attacker.attack(victim)
  if victim.HP <= 0:
    echo victim.name," is dead!"
  echo victim.name," 's HP is ",victim.HP 

test()
"""
var DIFFICULTY = 5

var world = World(difficulty: DIFFICULTY)
var player = Player(class: Warrior.int, name: "Dingus", level: 10, HP: 250, MP: 250, inventory: Inventory(), DPS: 175)

world.generateMobs()

for mob in world.mobs.mobs:
  if player.HP > 0:
    combat(mob,player)
    if mob.HP < 1:
      world.mobs.mobs.popFirst()
  else: 
    echo "Game over!"
    break
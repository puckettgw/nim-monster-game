include Monster

type 
  MonsterNames = enum 
    Vampire = "Vampire", Skeleton = "Skeleton", Wyvern = "Wyvern", Psycho = "Psycho"

type 
  MobList = ref object of RootObj
    mobs*: Deque[Monster]

type
  World = ref object of RootObj
    difficulty: int 
    mobs*: MobList
    # array of bonuses / debuffs ?
    # 


method generateMob(moblist: MobList, difficulty: int): void =
  var namevalue = rand(1..3)
  var mobname = $(rand(MonsterNames.low..MonsterNames.high))
  var mobdifficulty = rand(1..3)
  var moblevel = rand(1..15)
  var mobHP = rand(20..150)
  var mobMP = rand(20..150)
  var mobinv = Inventory()
  var mobdps = rand(10..50)
  var monster = Monster(difficulty: mobdifficulty, name: mobname, level: moblevel, HP: mobHP, MP: mobMP, inventory: mobinv, DPS: mobdps * mobdifficulty )
  moblist.mobs.addLast(monster)



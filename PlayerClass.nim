type
  Classes = enum
    Warrior = "Warrior", Rogue = "Rogue", Mage = "Mage", CLeric = "Cleric" 

type
  PlayerClass = ref object of RootObj
    class: Classes
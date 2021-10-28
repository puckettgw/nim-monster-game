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





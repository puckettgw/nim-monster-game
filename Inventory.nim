import std/deques
include Item
type
  Inventory = ref object of RootObj
    # some sort of collection of Item objects
    # some collection to represent Currency
    items: Deque[Item]

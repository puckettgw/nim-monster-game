type
  Item = ref object of RootObj
    # some sort of collection of Item objects
    # some collection to represent Currency
    itemType : int # some enum fuckery here for type e.g. helm, chest, pants, boots, weapon
    name : string
    rarity : int # enums again yay


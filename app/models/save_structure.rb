class SaveStructure < BaseData
  include Structure
  structure_root!
  #TO FIND
  #treasure maps
  #land of carnage unlocked
  #dark record/dark collection stats
  structure(
    [:header,           SaveHeader], #49
    [:unknown01,        [:unknown,2767]], #930..end = all 0
    [:unlocked_classes, [UnlockedClass,59]],
    [:characters,       [Character,128]], #3072 x 128
    [:senators,         [Senator,64]],
    [:maps,             [Map,256]],
    [:wtf_items,        [Item,4]], #wtf, there's 4 mystery items at the start of the array here
    [:pack_items,       [Item,24]],
    [:warehouse_items,  [Item,512]],
    [:unknown03,        [:unknown,4576]]
  )
end

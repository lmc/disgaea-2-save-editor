class SaveStructure < BaseData
  include Structure
  structure(
    [:header,     SaveHeader], #49
    [:unknown01,  [:unknown,3239]],
    [:characters, Characters], #3072 x 128
    [:unknown02,  [:unknown,7040]],
    [:wtf_items,  CharacterItems], #wtf, there's 4 mystery items at the start of the array here
    [:pack_items, PackItems],
    [:warehouse_items, WarehouseItems],
    [:unknown03,  [:unknown,(543072 - 393216 - 7040 - (256 * 4) - (256 * 24) - (256 * 512))]]
  )
end

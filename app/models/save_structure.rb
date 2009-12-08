class SaveStructure < BaseData
  include Structure
  structure(
    [:header,     SaveHeader], #49
    [:unknown01,  [:unknown,3239]],
    [:characters, Characters], #3072 x 16 TODO: Find out max characters in save
    [:unknown02,  [:unknown,(543072 - (3072 * Characters.const_get(:SIZE)))]]
  )
end
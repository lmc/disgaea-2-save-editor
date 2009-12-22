class WeaponSkills < BaseData
  include Structure
  SIZE = 112
  
  structure(
    [:weapon_skill_exp,   [:int32,SIZE]],
    [:weapon_skill,       [:int16,SIZE]],
    [:weapon_skill_level, [:int8,SIZE]]
  )
  
  def each(&block)
    SIZE.times { |i| yield(self[i]) }
  end
  
  def [](index)
    returning(WeaponSkill.new(self,index)) do |skill|
      skill.skill = weapon_skill[index].value
      skill.exp   = weapon_skill_exp[index].value
      skill.level = weapon_skill_level[index].value
    end
  end
  
end
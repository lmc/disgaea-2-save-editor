class WeaponSkills < BaseData
  include Structure
  
  structure(
    [:weapon_skill_exp,   [:int32,112]],
    [:weapon_skill,       [:int16,112]],
    [:weapon_skill_level, [:int8,112]]
  )
  
  def [](index)
    returning(WeaponSkill.new(self,index)) do |skill|
      skill.skill = weapon_skill[index].value
      skill.exp   = weapon_skill_exp[index].value
      skill.level = weapon_skill_level[index].value
    end
  end
  
end
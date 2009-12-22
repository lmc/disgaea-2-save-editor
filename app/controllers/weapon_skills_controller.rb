class WeaponSkillsController < InheritedResources::Base
  actions :index
  
  
  protected
  
  def collection
    @character ||= current_disassembled.characters[params[:character_id].to_i]
    @weapon_skills ||= @character.weapon_skills
    @weapon_skills
  end

end
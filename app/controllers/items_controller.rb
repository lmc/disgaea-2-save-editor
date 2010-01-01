class ItemsController < InheritedResources::Base
  belongs_to :character, :optional => true
  actions :index, :edit
  
  protected
  
  def resource
    @item ||= collection[params[:id].to_i]
    @item
  end
  
  def collection
    @items ||= if parent
        parent.items
      else
        raise "handle this too"
      end
    @items
  end
  
  def parent
    end_of_association_chain rescue nil #inherited_resources is fucking useless and doesn't properly detect parenting without this
    @parent ||= if params[:character_id]
        current_disassembled.characters[params[:character_id]]
      else
        raise "handle this"
      end
    @parent
  end

end
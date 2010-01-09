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
        @items_from = params[:items_from] || :pack
        case @items_from.to_sym
        when :pack
          current_disassembled.pack_items
        when :warehouse
          current_disassembled.warehouse_items
        when :wtf
          current_disassembled.wtf_items
        end
      end
    @items
  end
  
  def parent
    end_of_association_chain rescue nil #inherited_resources is fucking useless and doesn't properly detect parenting without this
    @parent ||= if params[:character_id]
        current_disassembled.characters[params[:character_id]]
      else
        nil
      end
    @parent
  end

end
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def cs(string)
    BaseData.clean(string)
  end
  
  def unknown_field_for(form_builder,unknown_field_name)
    unknown_values = form_builder.object.send(unknown_field_name).disassemble
    unknown_values = BaseData::UnknownCollection.new(unknown_values).as_int8.join(', ')
    if unknown_values.size >= 50
      form_builder.input unknown_field_name, :as => :text, :input_html => { :value => unknown_values }
    elsif unknown_values.size >= 15
      form_builder.input unknown_field_name, :as => :string, :input_html => { :value => unknown_values, :class => 'long' }
    else
      form_builder.input unknown_field_name, :as => :string, :input_html => { :value => unknown_values }
    end
  end
  
  #FIXME: Duplicate fields header
  def unknown_fields_for(form_builder)
    unknown_fields = form_builder.object.class.struct_order.select { |struct_name| struct_name.to_s =~ /^unknown/ }
    output = ""
    unknown_fields.each do |unknown_field|
      output << unknown_field_for(form_builder,unknown_field)
    end
    output
  end
end

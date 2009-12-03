# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def cs(string)
    BaseData.clean(string)
  end
end

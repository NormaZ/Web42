module ApplicationHelper
  def field_class(resource, field_name)
    if resource.errors[:messages].any? {|m| m == field_name}
      return "has-error".html_safe
    else
      return "".html_safe
    end
  end
end

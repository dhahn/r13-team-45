module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def derive_path_to_new title
    "/#{title.downcase.gsub(" ", "_")}/new"
  end

  def default_title_displayed? title
    title == "Fridge" || title == ""
  end

  def day_to_weekday day
    %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}[day-1]
  end

  def class_to_underscore item
    item.class.to_s.underscore
  end
end

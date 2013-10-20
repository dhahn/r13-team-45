module ChoreListsHelper
  def link_to_add_chore_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :f => builder, :interval => name)
    end
    link_to_function(name, "add_chore_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end

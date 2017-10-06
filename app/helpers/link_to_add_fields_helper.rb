module LinkToAddFieldsHelper
  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    objects_name = f.object.class.name.underscore.pluralize
    options_partial = options.delete(:partial)
    infered_partial = association.to_s.singularize + "_fields"
    partial_name = options_partial || infered_partial
    template_name = "#{objects_name}/#{partial_name}"
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(template_name, f: builder)
    end
    data = options[:data] || {}
    options[:data] = data.merge(
      link_to_add_field_id: id,
      link_to_add_field: fields.gsub("\n", "")
    )
    link_to name, '#', options
  end

  def link_to_remove_fields(name, target, options = {})
    data = options[:data] || {}
    options[:data] = data.merge(link_to_remove_field: target)
    link_to name, '#', options
  end
end

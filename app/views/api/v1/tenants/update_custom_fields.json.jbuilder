json.custom_fields do
  json.array! @tenant.custom_fields do |custom_field|
    json.(custom_field, :id, :name, :label, :field_type)
  end
end

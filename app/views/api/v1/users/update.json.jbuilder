json.(@user, :id, :email)
json.custom_field_values do
  json.array! @user.custom_field_values do |custom_field_value|
    json.(custom_field_value, :id, :value, :custom_field_id)
  end
end

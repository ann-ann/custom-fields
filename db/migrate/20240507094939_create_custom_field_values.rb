class CreateCustomFieldValues < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_field_values do |t|
      t.belongs_to :custom_field, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :value

      t.timestamps
    end
  end
end

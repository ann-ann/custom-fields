class CreateCustomFields < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_fields do |t|
      t.belongs_to :tenant, foreign_key: true
      t.string :field_type
      t.string :name
      t.string :label
      t.text :available_values
      t.boolean :is_required, default: false, null: false

      t.timestamps
    end
  end
end

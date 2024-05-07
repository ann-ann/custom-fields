class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.belongs_to :tenant, foreign_key: true
      t.index :email, unique: true

      t.timestamps
    end
  end
end

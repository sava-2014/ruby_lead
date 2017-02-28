class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :description
      t.string  :project
      t.float   :price
      t.timestamps

      t.references :user, foreign_key: true
    end
    add_index :products, [:user_id, :created_at]
  end
end

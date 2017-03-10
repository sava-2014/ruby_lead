class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.string  :target_name
      t.string  :target_base
      t.string  :target_traditional
      t.string  :target_criteria
      t.string  :target_minus
      t.string  :target_decision
      t.string  :target_advantages

      t.timestamps

      t.references :product, foreign_key: true
    end
    add_index :targets, [:product_id, :created_at]
  end
end

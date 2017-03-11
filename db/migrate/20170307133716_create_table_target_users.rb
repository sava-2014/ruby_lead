class CreateTableTargetUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :table_target_users do |t|
      t.string  :target_name
      t.string  :target_basic_needs
      t.string  :target_basic_solves
      t.string  :target_our_solve
      t.string  :target_our_solve_good
      t.string  :target_buy_criteria
      t.timestamps
    end
  end
end

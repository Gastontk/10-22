class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.string :poster_id
      t.string :owner_id

      t.timestamps null: false
    end
  end
end

class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :points
      t.decimal :value
      t.decimal :conversion

      t.timestamps
    end
  end
end

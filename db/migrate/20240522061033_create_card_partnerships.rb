class CreateCardPartnerships < ActiveRecord::Migration[7.1]
  def change
    create_table :card_partnerships do |t|
      t.integer :card_id
      t.integer :loyalty_program_id
      t.decimal :conversion_rate
      t.string :notes

      t.timestamps
    end
  end
end

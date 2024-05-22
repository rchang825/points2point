class ChangeConversionAndValueOnCards < ActiveRecord::Migration[7.1]
  def change
    rename_column :cards, :conversion, :conversion_rate
    remove_column :cards, :value
  end
end

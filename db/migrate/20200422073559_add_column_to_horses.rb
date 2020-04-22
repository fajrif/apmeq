class AddColumnToHorses < ActiveRecord::Migration[5.2]
  def change
		add_column :horses, :disciplines, :string
		add_column :horses, :height, :string
  end
end

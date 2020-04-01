class AddSlugForHorses < ActiveRecord::Migration[5.2]
  def change
		add_column :horses, :slug, :string, unique: true
    add_index :horses, :slug, unique: true
  end
end

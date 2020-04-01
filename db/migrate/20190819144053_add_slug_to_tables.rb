class AddSlugToTables < ActiveRecord::Migration[5.2]
  def change
		add_column :articles, :slug, :string, unique: true
    add_index :articles, :slug, unique: true
  end
end

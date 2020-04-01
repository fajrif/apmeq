class AddCategoryToFacilities < ActiveRecord::Migration[5.2]
  def change
		add_column :facilities, :category_name, :string
  end
end

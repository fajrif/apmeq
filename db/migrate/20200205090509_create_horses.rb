class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
    	t.string :name, null: false, default: ""
    	t.string :description, null: false, default: ""
    	t.string :sex, null: false, default: ""
    	t.string :year, null: false, default: ""
    	t.string :color, null: false, default: ""
    	t.string :breed, null: false, default: ""
    	t.integer :category_id, null: false, default: 0
      t.timestamps null: false
    end
  end
end

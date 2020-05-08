class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
    	t.string :name, null: false, default: ""
    	t.string :description, null: false, default: ""
      t.timestamps null: false
    end
  end
end

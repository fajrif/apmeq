class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
    	t.string :caption, null: false, default: ""
      t.timestamps null: false
    end
  end
end

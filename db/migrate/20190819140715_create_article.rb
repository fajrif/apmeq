class CreateArticle < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.timestamps null: false
    end
    add_index :articles, :title, unique: true
  end
end

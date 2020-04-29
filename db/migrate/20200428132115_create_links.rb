class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string   :name, null: false, default: ""
      t.string   :caption
      t.string   :url
    end
  end
end

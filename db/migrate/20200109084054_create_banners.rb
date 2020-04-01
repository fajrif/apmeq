class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.string   :link, null: false, default: ""
      t.string   :caption1, null: false, default: ""
      t.string   :caption2, null: false, default: ""
      t.string   :caption3, null: false, default: ""
      t.string   :description, null: false, default: ""
      t.timestamps null: false
    end
  end
end

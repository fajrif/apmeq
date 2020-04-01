class CreateContact < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :message, null: false, default: ""
      t.timestamps null: false
    end
  end
end

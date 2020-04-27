class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string   :name, null: false, default: ""
      t.string   :title
      t.string   :profile
      t.timestamps null: false
    end
  end
end

class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.string   :name, null: false, default: ""
      t.string   :title, null: false, default: ""
      t.string   :comment, null: false, default: ""
      t.timestamps null: false
    end
  end
end

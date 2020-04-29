class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string   :name, null: false, default: ""
			t.date :dob
			t.integer :instructor_id
			t.datetime :date_lesson
			t.string :emergency_contact_name
			t.string :emergency_contact_phone
			t.integer :as_member
      t.timestamps null: false
    end
  end
end

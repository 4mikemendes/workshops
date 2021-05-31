class CreateStudentWorkshops < ActiveRecord::Migration[6.0]
  def change
    create_table :student_workshops do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :workshop, null: false, foreign_key: true

      t.timestamps
    end
  end
end

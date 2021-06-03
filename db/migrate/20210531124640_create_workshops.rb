class CreateWorkshops < ActiveRecord::Migration[6.0]
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :workshop_description
      t.string :location
      t.integer :price
      t.date. :starting_date
      t.date. :ending_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

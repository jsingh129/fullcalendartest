class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :Name
      t.string :Description
      t.date :StartDate
      t.date :EndDate
      t.integer :Priority
      t.string :Location

      t.timestamps null: false
    end
  end
end

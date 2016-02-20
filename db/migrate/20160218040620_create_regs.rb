class CreateRegs < ActiveRecord::Migration
  def change
    create_table :regs do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

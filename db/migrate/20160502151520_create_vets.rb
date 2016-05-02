class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.string :doctor
      t.string :clinic
      t.string :phone

      t.timestamps null: false
    end
  end
end

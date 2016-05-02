class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :dob
      t.boolean :checked_in
      t.text :info
      t.references :breed, index: true, foreign_key: true
      t.references :owner, index: true, foreign_key: true
      t.references :vet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

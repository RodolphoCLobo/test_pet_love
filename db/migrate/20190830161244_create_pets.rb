class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.float :monthly_cost
      t.integer :person_id
      t.integer :breed_id

      t.timestamps
    end
  end
end

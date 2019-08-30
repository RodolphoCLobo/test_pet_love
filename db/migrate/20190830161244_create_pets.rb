class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.float :monthly_cost

      t.timestamps
    end
  end
end

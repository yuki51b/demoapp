class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.string :gender
      t.string :food
      t.string :color

      t.timestamps
    end
  end
end

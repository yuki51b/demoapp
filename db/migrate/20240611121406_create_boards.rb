class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end

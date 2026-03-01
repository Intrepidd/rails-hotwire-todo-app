class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end

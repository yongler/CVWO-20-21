class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :task
      t.boolean :completed
      t.string :tags

      t.timestamps
    end
  end
end

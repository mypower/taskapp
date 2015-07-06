class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :task_id
      t.boolean :done, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :works, :users
  end
end

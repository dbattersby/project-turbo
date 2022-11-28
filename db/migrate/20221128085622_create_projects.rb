class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :due_date
      t.integer :status, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

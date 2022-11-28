class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :project, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end

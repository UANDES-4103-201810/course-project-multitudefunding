class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :approved_by, foreign_key: true, default: nil, null: true
      t.integer :money_goal
      t.datetime :finish_date
      t.text :description
      t.boolean :approved, default: false
      t.float :rating
      t.boolean :founded, default: false
      t.datetime :foundation_date, default: nil 
      t.datetime :approval_date, default: nil

      t.timestamps
    end
  end
end

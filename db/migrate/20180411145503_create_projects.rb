class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :approved_by, foreign_key: true
      t.integer :money_goal
      t.datetime :finish_date
      t.text :description
      t.boolean :approved
      t.float :rating
      t.boolean :founded
      t.datetime :foundation_date
      t.datetime :approval_date

      t.timestamps
    end
  end
end

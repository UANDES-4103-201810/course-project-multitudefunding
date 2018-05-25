class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.string :name
      t.references :project, foreign_key: true
      t.text :decription
      t.integer :price

      t.timestamps
    end
  end
end

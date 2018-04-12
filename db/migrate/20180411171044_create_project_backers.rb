class CreateProjectBackers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_backers do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :amount_invested

      t.timestamps
    end
  end
end

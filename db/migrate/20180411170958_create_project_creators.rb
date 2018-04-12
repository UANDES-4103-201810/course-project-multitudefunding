class CreateProjectCreators < ActiveRecord::Migration[5.1]
  def change
    create_table :project_creators do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :owner

      t.timestamps
    end
  end
end

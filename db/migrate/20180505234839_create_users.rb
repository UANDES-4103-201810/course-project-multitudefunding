class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :nickname
      t.string :phone_number
      t.string :user_type, default: "generic"
      t.timestamps
    end
  end
end

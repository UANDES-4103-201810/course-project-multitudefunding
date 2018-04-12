class CreatePromiseBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :promise_buyers do |t|
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true
      t.integer :amount_invested

      t.timestamps
    end
  end
end

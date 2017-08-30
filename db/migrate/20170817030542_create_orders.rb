class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_number
      t.date :order_date
      t.float :total
      t.address :integer
      t.timestamps null: false
    end
  end
end
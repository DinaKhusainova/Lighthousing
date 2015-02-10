class CreatePhotoshopOrders < ActiveRecord::Migration
  def change
    create_table :model_orders do |t|
      t.string :name
      t.string :email
      t.text   :message
      t.timestamps
    end

    create_table :photos do |t|
      t.integer :model_order_id, index: true
      t.attachment :image
      t.timestamps
    end
  end
end

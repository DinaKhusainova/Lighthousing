class CreateModelOrders < ActiveRecord::Migration
  def change
    create_table :photoshoot_orders do |t|
      t.string :name
      t.string :email
      t.text   :message
      t.timestamps
    end
  end
end

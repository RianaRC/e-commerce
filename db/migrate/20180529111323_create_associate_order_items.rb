class CreateAssociateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :associate_order_items do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end

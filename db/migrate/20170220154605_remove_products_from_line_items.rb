class RemoveProductsFromLineItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :line_items, :products, foreign_key: true
  end
end

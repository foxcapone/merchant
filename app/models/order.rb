class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true

  PAYMENT_TYPES = ['Check', 'Credit Card', 'Paypal']

  validates :pay_type, inclusion: PAYMENT_TYPES

  # pull items out of cart and add them to the order
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    # remove cart id
    item.cart_id = nil
    # add to order line items
    line_items << item
    end
  end

  def subtotal
    # SQL version
    line_items.select("SUM(quantity * price) AS sum")[0].sum
    # Ruby version
    # line_items.to_a.sum { |item| item.total }
  end
end





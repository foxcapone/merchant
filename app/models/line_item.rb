class LineItem < ApplicationRecord
  belongs_to :products
  belongs_to :cart, optional: true
end

class Product < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" },
                            default_url: "missing_:style.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates_presence_of :name, :price, :quantity, :description, :brand, :category
  validates_numericality_of :price, greater_than_or_equal_to: 0.01
  validates_numericality_of :quantity, greater_than_or_equal_to: 0

  # Fields
  # name - presence
  # description - presence
  # category - presence
  # brand - presence
  # price - >= 0.01
  # quantity - >= 0
end

class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, uniqueness: true, presence: true
  validates :price, presence: true

  belongs_to :category

  has_many :line_items
  has_many :orders, through: :line_items
end

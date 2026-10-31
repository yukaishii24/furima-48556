class Item < ApplicationRecord
  
  belongs_to :user
  has_many :comments
  has_one :order  
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_area_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A(?:[3-9][0-9]{2}|[1-9][0-9]{3,6})\z/ }
end

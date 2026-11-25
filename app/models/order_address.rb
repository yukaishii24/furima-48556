class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address_line1, :address_line2, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "imput correctly"}
  validates :city
  validates :address_line1
  validates :phone_number, format: {with: /\A0\d{9,10}\z/, message: "imput correctly"}
  validates :token
  end

  validates :shipping_area_id, numericality: { other_than: 0 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Address.create( postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, order_id: order.id)
  end

end
class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\0\d{9,10}＼z/ }
  end

  def save
    oder = Order.create(udre_id: user_id, item_id: item_id)
    Sipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number:phone_number, order_id: order.id)
  end
end
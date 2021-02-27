class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :token
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end

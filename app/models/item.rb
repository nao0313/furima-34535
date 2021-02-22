class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :detail_id
      validates :state_id 
      validates :sipping_cost_id
      validates :prefecture_id
      validates :selling_price_id
    end
  end

  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail
  belongs_to :state
  belongs_to :sipping_cost
  belongs_to :prefecture
  belongs_to :selling_price

end

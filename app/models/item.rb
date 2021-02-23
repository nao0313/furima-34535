class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :selling_price

    with_options numericality: { other_than: 1 } do
      validates :detail_id
      validates :state_id 
      validates :sipping_cost_id
      validates :prefecture_id
      validates :sipping_day_id
    end
  end

  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  

end

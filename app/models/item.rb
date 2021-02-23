class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
     validates :selling_price, format: { with: /\A[0-9]+\z/ },numericality: { only_integer: true,
      greater_than: 299, less_than: 10_000_000 } 

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
  belongs_to_active_hash :detail
  belongs_to_active_hash :state
  belongs_to_active_hash :sipping_cost
  belongs_to_active_hash :sipping_day
  belongs_to_active_hash :prefecture
end

FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '19022229999' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,        presence: true, length: { maximum: 40 }
         validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/}
         validates :birthday,        presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
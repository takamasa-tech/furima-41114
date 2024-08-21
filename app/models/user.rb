# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
  validates :birthday, presence: true
end

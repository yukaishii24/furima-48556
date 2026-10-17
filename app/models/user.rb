class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname , presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英字と数字の両方を含めて入力してください" }, allow_nil: true
  validates :first_name , presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :last_name , presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name_kana , presence: true, format: { with: /\A[\p{Katakana}ー　]+\z/, message: "は全角カタカナで入力してください" }
  validates :last_name_kana , presence: true, format: { with: /\A[\p{Katakana}ー　]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday , presence: true

end

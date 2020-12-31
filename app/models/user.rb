class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で6文字以上入力してください。"}
    validates :birth_date
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"} do
    validates :last_name_kana
    validates :first_name_kana
  end
end

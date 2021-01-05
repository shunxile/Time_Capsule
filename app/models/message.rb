class Message < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
    validates :title
    validates :message
    validates :whom
  end
  
  validates :open_plan, presence: true, format: { with: /\A[0-9]{4}[-][0-9]{2}[-][0-9]{2}\z/, message: '『-』を使い正しく入力してください' }
end

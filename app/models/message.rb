class Message < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many_attached :videos

  with_options presence: true, length: { maximum: 50 } do
    validates :title
    validates :whom
  end
  
  with_options presence: true do
    validates :message, length: { maximum: 200 }
    validates :open_plan, format: { with: /\A[0-9]{4}[-][0-9]{2}[-][0-9]{2}\z/, message: 'は『-』を使い正しく入力してください' }
    validates :user_id
  end
end

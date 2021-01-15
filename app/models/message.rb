class Message < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one_attached :video
  has_many :message_tag_forms, dependent: :destroy
  has_many :tags, through: :message_tag_forms

  def self.search(search, id)
    if search != ""
      Item.joins(:tags).where(tags: {name: "#{search}"} , user_id: id)
    else 
      Item.where(user_id: id)
    end
  end
end

class Message < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one_attached :video
  has_many :message_tag_forms
  has_many :tags, through: :message_tag_forms

  
end

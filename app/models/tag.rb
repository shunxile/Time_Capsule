class Tag < ApplicationRecord
  has_many :messages, through: :message_tag_forms
  has_many :message_tag_forms

  validates :name, uniqueness: true
end

class MessageTagForm < ApplicationRecord
  belongs_to :message
  belongs_to :tag
end

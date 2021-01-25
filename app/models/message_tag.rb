class MessageTag

  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  attr_accessor :title, :whom, :open_plan, :message, :images, :video, :name, :user_id

  with_options presence: true, length: { maximum: 50 } do
    validates :title
    validates :whom
  end
  
  with_options presence: true do
    validates :message, length: { maximum: 200 }
    validates :open_plan
    validates :user_id
    validates :name, length: { maximum: 20 }
  end

  def save
    @message = Message.create(title: title, whom: whom, open_plan: open_plan, message: message, images: images, video: video, user_id: user_id)
    tag = Tag.find_or_create_by(name: name)

    MessageTagForm.create(message_id: message.id, tag_id: tag.id)
  end

  def update
    @message = Message.update(title: title, whom: whom, open_plan: open_plan, message: message, images: images, video: video, user_id: user_id)
    tag = Tag.find_or_create_by(name: name)

    MessageTagForm.update(message_id: message.id, tag_id: tag.id)
  end

  def find
  end
end
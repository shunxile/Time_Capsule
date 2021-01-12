class MessageTagForm

  include ActiveModel::ActiveModel
  attr_accessor :title, :whom, :open_plan, :message, :images, :video, :name

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
    message = Message.create(title: title, whom: whom, open_plan: open_plan, message: message, images: images, video:, video)
    tag = Tag.create(name: name)

    MessaeTagForm.create(message_id: messag.id, tag_id: tag.id)
  end
end
class MessageTag

  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  attr_accessor :title, :whom, :open_plan, :message, :images, :video, :name, :user_id, :encryted_password

  with_options presence: true, length: { maximum: 50 } do
    validates :title
    validates :whom
  end
  
  with_options presence: true do
    validates :message, length: { maximum: 200 }
    validates :open_plan
    validates :user_id
    validates :name, length: { maximum: 20 }
    validates :password, length: { maximum: 16, minlength: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で8文字以上16文字以下で入力してください。"}
  end

  def save 
    @message = Message.create(title: title, whom: whom, open_plan: open_plan, message: message, images: images, video: video, user_id: user_id, encryted_password: encryted_password)
    tag = Tag.find_or_create_by(name: name)

    @message_tag = MessageTagForm.create(message_id: message.id, tag_id: tag.id)
  end
end
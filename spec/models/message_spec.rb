require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @message = FactoryBot.build(:message, user_id: @user.id)
    @message.images = fixture_file_upload('public/images/test_image.png')
    @message.video = fixture_file_upload('public/videos/test_video.mp4')
  end

  context '新規投稿ができる時' do
    it "title・message・open_plan・whomがあれば保存できる" do
      expect(@message).to be_valid
    end
    it "imagesが空でも保存できる" do
      @message.images = nil
      expect(@message).to be_valid
    end
    it "videoが空でも保存できる" do
      @message.video = nil
      expect(@message).to be_valid
    end
    it "image・videoが空でも保存できる" do
      @message.images = nil
      @message.video = nil
      expect(@message).to be_valid
    end
  end

  context '新規投稿ができない時' do
    it "titleが空だと保存できない" do
      @message.title = nil
      @message.valid?
      binding.pry
      expect(@message.errors.full_messages).to include("タイトルを入力してください")
    end
    it "titleが50文字以上だと保存できない" do
      @message.title = "a" * 51
      @message.valid?
      expect(@message.errors.full_messages).to include("タイトルは50文字以内で入力してください")
    end
    it "messageが空だと保存できない" do
      @message.message = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("メッセージを入力してください")
    end
    it "messageが200文字以上だと保存できない" do
      @message.message = "a" * 201
      @message.valid?
      expect(@message.errors.full_messages).to include("メッセージは200文字以内で入力してください")
    end
    it "whomが空だと保存できない" do
      @message.whom = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("宛先を入力してください")
    end
    it "whomが50文字以上だと保存できない" do
      @message.whom = "a" * 51
      @message.valid?
      expect(@message.errors.full_messages).to include("宛先は50文字以内で入力してください")
    end
    it "open_planが空だと保存できない" do
      @message.open_plan = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("開封予定日を入力してください")
    end
    it "user_idが空だと保存できない" do
      @message.user_id = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Userを入力してください")
    end
  end
end

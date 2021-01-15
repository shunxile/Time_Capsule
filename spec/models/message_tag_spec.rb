require 'rails_helper'

RSpec.describe MessageTag, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @message_tag = FactoryBot.build(:message_tag, user_id: @user.id)
    @message_tag.images = fixture_file_upload('public/images/test_image.png')
    @message_tag.video = fixture_file_upload('public/videos/test_video.mp4')
  end

  context '新規投稿ができる時' do
    it "title・message・open_plan・whom・nameがあれば保存できる" do
      expect(@message_tag).to be_valid
    end
    it "imagesが空でも保存できる" do
      @message_tag.images = nil
      expect(@message_tag).to be_valid
    end
    it "videoが空でも保存できる" do
      @message_tag.video = nil
      expect(@message_tag).to be_valid
    end
    it "image・videoが空でも保存できる" do
      @message_tag.images = nil
      @message_tag.video = nil
      expect(@message_tag).to be_valid
    end
  end

  context '新規投稿ができない時' do
    it "titleが空だと保存できない" do
      @message_tag.title = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("タイトルを入力してください")
    end
    it "titleが50文字以上だと保存できない" do
      @message_tag.title = "a" * 51
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("タイトルは50文字以内で入力してください")
    end
    it "messageが空だと保存できない" do
      @message_tag.message = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("メッセージを入力してください")
    end
    it "messageが200文字以上だと保存できない" do
      @message_tag.message = "a" * 201
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("メッセージは200文字以内で入力してください")
    end
    it "whomが空だと保存できない" do
      @message_tag.whom = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("宛先を入力してください")
    end
    it "whomが50文字以上だと保存できない" do
      @message_tag.whom = "a" * 51
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("宛先は50文字以内で入力してください")
    end
    it "open_planが空だと保存できない" do
      @message_tag.open_plan = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("開封予定日を入力してください")
    end
    it "user_idが空だと保存できない" do
      @message_tag.user_id = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("Userを入力してください")
    end
    it "nameが空だと保存できない" do
      @message_tag.name = nil
      @message_tag.valid?
      expect(@message_tag.errors.full_messages).to include("タグを入力してください")
    end
  end
end

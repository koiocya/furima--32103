require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '本人情報確認新規登録' do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = nil
      @user.last_name  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank",
        "First name is invalid. Input full-width characters.",
        "Last name can't be blank",
        "Last name is invalid. Input full-width characters.")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "ab"
      @user.last_name  = "cd"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.", "Last name is invalid. Input full-width characters.")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.first_name_reading = nil
      @user.last_name_reading  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank",
        "First name reading is invalid. Input full-width katakana characters.",
        "Last name reading can't be blank",
        "Last name reading is invalid. Input full-width katakana characters.")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_reading = "tanaka"
      @user.last_name_reading  = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.",
        "Last name reading is invalid. Input full-width katakana characters.")
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
 end
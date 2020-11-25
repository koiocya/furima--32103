require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?

      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスは、@がないと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordがパスワードは、6文字以上での入力でないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = 'a000000'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）、値の一致しないと登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '1234ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
  end

  describe '本人情報確認新規登録' do
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.first_name = nil
      @user.last_name  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank",
                                                    'First name is invalid. Input full-width characters.',
                                                    "Last name can't be blank",
                                                    'Last name is invalid. Input full-width characters.')
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'ab'
      @user.last_name  = 'cd'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.', 'Last name is invalid. Input full-width characters.')
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.first_name_reading = nil
      @user.last_name_reading  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank",
                                                    'First name reading is invalid. Input full-width katakana characters.',
                                                    "Last name reading can't be blank",
                                                    'Last name reading is invalid. Input full-width katakana characters.')
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = 'tanaka'
      @user.last_name_reading  = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.',
                                                    'Last name reading is invalid. Input full-width katakana characters.')
    end
    it '生年月日が必須であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

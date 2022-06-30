require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目が存在すれば登録できる' do
      expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")    
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'Aaaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name01が空では登録できない' do
        @user.name01 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name01 can't be blank")
      end
      it 'name01が半角文字が含まれていると登録できない' do
        @user.name01 = 'ｱ/111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name01 is invalid")
      end
      it 'name02が空では登録できない' do
        @user.name02 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name02 can't be blank")
      end
      it 'name02が半角文字が含まれていると登録できない' do
        @user.name02 = 'ｱ/111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name02 is invalid")
      end      
      it 'kame01が空では登録できない' do
        @user.kana01 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana01 can't be blank")
      end
      it 'kame01にカタカナ以外の文字が含まれていると登録できない' do
        @user.kana01 = 'あa0阿/'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana01 is invalid")
      end
      it 'kame02が空では登録できない' do
        @user.kana02 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana02 can't be blank")
      end
      it 'kame02にカタカナ以外の文字が含まれていると登録できない' do
        @user.kana02 = 'あa0阿/'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana02 is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
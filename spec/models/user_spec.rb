require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user_with_child_ages =  FactoryBot.create(:user, :user_with_child_ages) 
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、birth_day、last_name、first_name、last_name_kana、first_name_kana、 child_age_idsが存在すれば登録できる' do
        expect(@user_with_child_ages).to be_valid
      end
      it 'nicknameとemail、passwordとpassword_confirmation、birth_day、last_name、first_name、last_name_kana、first_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      # //nicknameのテスト//
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      # //emailのテスト//
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      # //password、password_confirmationのテスト//
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは半角英数字混合でないと登録できない(全て英字の場合)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordは半角英数字混合でないと登録できない(全て数字の場合)' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordは半角英数字混合でないと登録できない(全角の場合)' do
        @user.password = 'ＡＡＡ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      # //last_name、first_nameのテスト//
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name_kana = 'YAMADA'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は不正な値です")
      end
      it 'first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name_kana = 'TARO'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
      # //last_name_kana、first_name_kanaのテスト//
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'last_name_kanaは全角(カタカナ)でないと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は不正な値です")
      end
      it 'first_name_kanaは全角(カタカナ)でないと登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
      # //birth_dayのテスト/
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end

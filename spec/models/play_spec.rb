require 'rails_helper'

RSpec.describe Play, type: :model do
  before do
    @play = FactoryBot.build(:play)
  end

  describe '遊びネタ投稿' do
    context '遊びネタを投稿できるとき' do
      it 'image、play_name、preparation、how_to_play、play_category_id、target_age_id、estimated_time_idが存在すれば投稿できる' do
        expect(@play).to be_valid
      end
      it 'preparationが空、estimated_time_idが未選択でも投稿できる' do
        @play.preparation = ""
        @play.estimated_time_id = 1
        expect(@play).to be_valid
      end
    end
    context '遊びネタを投稿できないとき' do
      # //imageのテスト//
      it 'imageが空では投稿できない' do
        @play.image = nil
        @play.valid?
        expect(@play.errors.full_messages).to include("メイン画像を入力してください")
      end
      # //play_nameのテスト//
      it 'play_nameが空では投稿できない' do
        @play.play_name = ''
        @play.valid?
        expect(@play.errors.full_messages).to include("遊び名を入力してください")
      end
      # //how_to_playのテスト//
      it 'item_explanationが空では投稿できない' do
        @play.how_to_play = ''
        @play.valid?
        expect(@play.errors.full_messages).to include("遊び方を入力してください")
      end
      # //play_category_idのテスト//
      it 'play_category_idが未選択では投稿できない' do
        @play.play_category_id = nil
        @play.valid?
        expect(@play.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'play_category_idで「---」を選択したら投稿できない' do
        @play.play_category_id = 1
        @play.valid?
        expect(@play.errors.full_messages).to include("カテゴリーを選択してください")
      end
      # //target_age_idのテスト//
      it 'target_age_idが未選択では投稿できない' do
        @play.target_age_id = nil
        @play.valid?
        expect(@play.errors.full_messages).to include("対象年齢を入力してください")
      end
      it 'target_age_idで「---」を選択したら投稿できない' do
        @play.target_age_id = 1
        @play.valid?
        expect(@play.errors.full_messages).to include("対象年齢を選択してください")
      end
      # //その他テスト//
      it 'userが紐付いていなければ投稿できない' do
        @play.user = nil
        @play.valid?
        expect(@play.errors.full_messages).to include("ユーザー名を入力してください")
      end
    end
  end
end

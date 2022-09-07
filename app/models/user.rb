class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_child_ages
  has_many :child_ages, through: :user_child_ages
  
  has_many :play
  has_many :favorite_play

  validates :nickname, presence:  true
  validates :birth_day, presence: true

  # 半角英数字混合でなければ保存できない
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }

  # 全角(漢字・ひらがな・カタカナ)でなければ保存できない
  ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :last_name, presence: true, format: { with: ZENKAKU_REGEX }
  validates :first_name, presence: true, format: { with: ZENKAKU_REGEX }

  # 全角(カタカナ)でなければ保存できない
  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates :last_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX }

  # favorite_playテーブルに引数play_idが存在しているかを確認
  def favorite_find(play_id)
    favorite_play.where(play_id: play_id).exists?
  end

end

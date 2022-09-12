class Play < ApplicationRecord

belongs_to :user
has_many :favorite_plays
has_many :achivement_plays

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :play_category
belongs_to :target_age
belongs_to :estimated_time

validates :play_name, presence: true
validates :how_to_play, presence: true
validates :play_category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
validates :target_age_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }

has_one_attached :image
validates :image, presence: true


end

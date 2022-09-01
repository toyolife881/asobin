class Play < ApplicationRecord

belongs_to :user

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :play_category
belongs_to :target_age
belongs_to :estimated_time

validates :play_name, presence: true
validates :how_to_play, presence: true
validates :play_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
validates :target_age_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

has_one_attached :image
validates :image, presence: true


end

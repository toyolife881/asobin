class Play < ApplicationRecord

belongs_to :user

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :play_category
belongs_to :target_age
belongs_to :estimated_time

end

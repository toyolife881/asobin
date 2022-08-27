class ChildAge < ApplicationRecord

  has_many :user_child_ages
  has_many :users, through: :user_child_ages

end

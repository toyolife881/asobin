class TargetAge < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '全年齢' },
    { id: 3, name: '0〜2歳' },
    { id: 4, name: '3〜5歳' },
    { id: 5, name: '小学校低学年' },
    { id: 6, name: '小学校中学年' },
    { id: 7, name: '小学校高学年' },
    { id: 8, name: '中学生' },
    { id: 9, name: '高校生以上' }
  ]

  include ActiveHash::Associations
  has_many :plays
  end
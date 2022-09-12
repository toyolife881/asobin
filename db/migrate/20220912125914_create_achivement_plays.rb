class CreateAchivementPlays < ActiveRecord::Migration[6.0]
  def change
    create_table :achivement_plays do |t|
      t.references :user, foreign_key: true
      t.references :play, foreign_key: true
      t.timestamps
    end
  end
end

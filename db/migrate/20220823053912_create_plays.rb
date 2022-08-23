class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.string        :play_name,            null: false
      t.text          :preparation,          null: false
      t.text          :how_to_play,          null: false
      t.integer       :play_category_id,     null: false
      t.integer       :target_age_id,        null: false
      t.integer       :estimated_time_id
      # t.references    :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end

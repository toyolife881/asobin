class CreateUserChildAges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_child_ages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :child_age, null: false, foreign_key: true
      t.timestamps
    end
  end
end

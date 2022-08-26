class CreateChildAges < ActiveRecord::Migration[6.0]
  def change
    create_table :child_ages do |t|
      t.string        :name,            null: false
      t.timestamps
    end
  end
end

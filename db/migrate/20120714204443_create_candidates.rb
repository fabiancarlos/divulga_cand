class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, null: false, unique: true
      t.string :gender, null: false
      t.string :party, null: false
      t.string :coalition_composition, default: nil
      t.string :schooling_level, null: false

      t.timestamps
    end
    add_index :candidates, :name
    add_index :candidates, :schooling_level
  end
end

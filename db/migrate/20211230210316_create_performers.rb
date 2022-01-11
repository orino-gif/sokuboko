class CreatePerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :performers, id: false do |t|
      t.column      :user_id, 'INTEGER PRIMARY KEY NOT NULL'
      t.string      :nickname
      t.string      :image
      t.integer     :attack
      t.integer     :age
      t.string      :three_size
      t.string      :identification
      t.string      :full_body
      t.timestamps
    end
  end
end

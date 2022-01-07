class CreatePerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :performers, id: false do |t|
      t.column :user_id, 'INTEGER PRIMARY KEY NOT NULL'
      t.string      :image
      t.timestamps
    end
  end
end

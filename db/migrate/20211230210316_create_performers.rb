class CreatePerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :performers, id: false do |t|
      t.column      :user_id, 'INTEGER PRIMARY KEY NOT NULL'
      t.string      :image
      t.text        :attack
      t.integer     :age
      t.string      :three_size
      t.string      :identification
      t.string      :full_body
      t.string      :progress
      t.string      :sns
      t.time        :sun_start  , null: false, default: "2022/1/1 00:00"
      t.time        :tue_start  , null: false, default: "2022/1/1 00:00"
      t.time        :wed_start  , null: false, default: "2022/1/1 00:00"
      t.time        :thu_start  , null: false, default: "2022/1/1 00:00"
      t.time        :fri_start  , null: false, default: "2022/1/1 00:00"
      t.time        :sat_start  , null: false, default: "2022/1/1 00:00"
      t.time        :sun_end    , null: false, default: "2022/1/1 00:00" 
      t.time        :tue_end    , null: false, default: "2022/1/1 00:00"
      t.time        :wed_end    , null: false, default: "2022/1/1 00:00"
      t.time        :thu_end    , null: false, default: "2022/1/1 00:00"
      t.time        :fri_end    , null: false, default: "2022/1/1 00:00"
      t.time        :sat_end    , null: false, default: "2022/1/1 00:00"

      t.timestamps
    end
  end
end

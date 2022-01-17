class CreatePerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :performers, id: false do |t|
      t.column      :user_id, 'INTEGER PRIMARY KEY NOT NULL'
      t.string      :nickname
      t.string      :image
      t.text        :attack
      t.integer     :age
      t.string      :three_size
      t.string      :identification
      t.string      :full_body
      t.string      :progress
      t.time        :sun_start
      t.time        :tue_start
      t.time        :wed_start
      t.time        :thu_start
      t.time        :fri_start
      t.time        :sat_start
      t.time        :sun_end
      t.time        :tue_end
      t.time        :wed_end
      t.time        :thu_end
      t.time        :fri_end
      t.time        :sat_end

      t.timestamps
    end
  end
end

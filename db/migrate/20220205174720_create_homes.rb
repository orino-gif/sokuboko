class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.text    :request
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end

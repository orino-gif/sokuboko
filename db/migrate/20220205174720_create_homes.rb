class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.text :request
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end

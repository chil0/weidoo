class CreateChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :chirps do |t|
      t.integer :user_id
      t.string :chirp
      t.binary :photo
      t.string :file_name
      t.string :file_type
      t.timestamp :chirped_at

      t.timestamps
    end
  end
end

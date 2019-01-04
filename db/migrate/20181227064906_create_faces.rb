class CreateFaces < ActiveRecord::Migration[5.2]
  def change
    create_table :faces do |t|
      t.integer :user_id
      t.string :name
      t.string :content_type
      t.binary :content

      t.timestamps
    end
  end
end

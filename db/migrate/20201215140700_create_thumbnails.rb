class CreateThumbnails < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbnails do |t|
      t.string :name ,null: false
      t.references :video ,foreign_key: true
      t.timestamps
    end
  end
end

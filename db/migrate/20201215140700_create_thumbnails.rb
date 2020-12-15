class CreateThumbnails < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbnails do |t|
      t.references :video ,foreign_key: true
      t.timestamps
    end
  end
end

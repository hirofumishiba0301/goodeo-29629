class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name ,null: false
      t.references :user ,foreign_key: true
      t.text :info ,null: false
      t.integer :category_id ,null: false
      t.integer :goodjobs_count 
      t.integer :views 
      t.timestamps
    end
  end
end

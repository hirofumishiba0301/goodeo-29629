class CreateGoodjobs < ActiveRecord::Migration[6.0]
  def change
    create_table :goodjobs do |t|
      t.references :user ,foreign_key: true
      t.references :video ,foreign_key: true
      t.timestamps
    end
  end
end

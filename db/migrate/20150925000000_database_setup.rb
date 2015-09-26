class DatabaseSetup < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.timestamps null: false
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :img_url

      t.references :user, index: true, foreign_keys: true

      t.timestamps
    end
  end
end

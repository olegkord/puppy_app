class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :content

      t.references :user, index: true, foreign_keys: true
      t.references :post, index: true, foreign_keys: true

      t.timestamps
    end
  end
end

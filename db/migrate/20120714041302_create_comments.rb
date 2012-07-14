class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.string :url
      t.text :body
      t.references :post

      t.timestamps
    end
    add_index :comments, :post_id
  end
end

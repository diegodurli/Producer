class CreateCategoriesPosts < ActiveRecord::Migration
  def up
    create_table "categories_posts", id: false, force: true do |t|
      t.integer :post_id    , null: false
      t.integer :category_id, null: false
    end
  end

  def down
    drop_table "categories_posts"
  end
end

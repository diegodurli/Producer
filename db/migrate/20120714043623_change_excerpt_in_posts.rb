class ChangeExcerptInPosts < ActiveRecord::Migration
  def up
    change_column :posts, :excerpt, :text
  end

  def down
    change_column :posts, :excerpt, :string
  end
end

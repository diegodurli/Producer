class RenamePermalinkToSlugInPost < ActiveRecord::Migration
  def up
    rename_column :posts, :permalink, :slug
  end

  def down
    rename_column :posts, :slug, :permalink
  end
end

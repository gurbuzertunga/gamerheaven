class RemoveImageLinksFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :image_link
  end
end

class AddImageLinkToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :vote_counter, :integer
    add_column :articles, :image_link, :integer
  end
end

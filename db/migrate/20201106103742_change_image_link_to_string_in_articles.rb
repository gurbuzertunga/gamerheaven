class ChangeImageLinkToStringInArticles < ActiveRecord::Migration[6.0]
  def up
    change_column :articles, :image_link, :string
  end

  def down
    change_column :articles, :image_link, :integer
  end
end

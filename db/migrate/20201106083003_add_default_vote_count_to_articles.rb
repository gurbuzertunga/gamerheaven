class AddDefaultVoteCountToArticles < ActiveRecord::Migration[6.0]
  def change
    change_column_default :articles, :vote_counter, 0
  end
end

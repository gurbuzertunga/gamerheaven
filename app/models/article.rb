class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    # validates_presence_of :image_link, message: 'You must upload an image'
    validates_presence_of :categories, message: 'You must choose a category'

    belongs_to :user
    has_many :votes
    has_one_attached :picture

    has_many :article_categories, class_name: 'ArticleCategory'
    has_many :categories, through: :article_categories, source: :category
    has_many :users_voted, through: :votes, source: :user
    
    def self.top_voted_article
        Article.order(vote_counter: :desc).first
    end

    def user_voted?(user_id)
        true if users_voted.where(id: user_id).first
    end

    def vote(user_id)
        vote = votes.build
        vote.user_id = user_id
        self.vote_counter = vote_counter + 1
        vote.save
    end

    def unvote(user_id)
        votes.where(user_id: user_id).first.destroy
        self.vote_counter = vote_counter - 1
    end

    def truncate
        body.length >= 200 ? body[0..200] + ' ...' : body + ' ...'
    end

    def truncate_title
        title.length >= 50 ? body[0..50] + ' ...' : title + ' ...'
    end
end

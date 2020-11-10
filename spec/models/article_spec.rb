require 'rails_helper'
require 'faker'

RSpec.describe Article, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { should belong_to(:user)}
    it { should have_many(:votes)}
    it { should have_one_attached(:picture)}
    it { should have_many(:article_categories).class_name(:ArticleCategory)}
    it { should have_many(:categories).through(:article_categories)}
    it { should have_many(:users_voted).through(:votes)}
  end

  context 'Scopes' do
    it "applies a default scope to descending order of articles" do
      expect(Article.all.order(created_at: :desc).to_sql).to eq Article.all.order(created_at: :desc).to_sql
    end
  end

end
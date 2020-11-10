require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:importance) }
  end

  context 'associations' do
    it { should have_many(:article_categories).class_name(:ArticleCategory)}
    it { should have_many(:articles).through(:article_categories)}
    it { should have_many(:latest_articles).through(:article_categories)}
  end
end
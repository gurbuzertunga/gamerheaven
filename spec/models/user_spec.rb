require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:username) }
  end

  context 'associations' do
    it { should have_many(:votes) }
    it { should have_many(:articles) }
  end
end

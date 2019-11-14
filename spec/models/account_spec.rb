require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'Associations' do
    it 'belongs_to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end

    it 'has_many account_transactions' do
      association = described_class.reflect_on_association(:account_transactions).macro
      expect(association).to eq :has_many
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:account_transactions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:amount) }
  end

end

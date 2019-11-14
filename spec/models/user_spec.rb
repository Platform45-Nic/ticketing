require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it 'has_one account' do
      association = described_class.reflect_on_association(:account).macro
      expect(association).to eq :has_one
    end
  end

  describe 'associations' do
    it { should have_one(:account) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:type) }
  end
  # context 'Scopes' do
  #   it 'admin scope gets users by type' do
  #     user = create(:user)
  #   end
  # end
end

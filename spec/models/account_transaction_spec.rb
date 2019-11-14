require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do
  context 'Associations' do
    it 'belongs_to account' do
      association = described_class.reflect_on_association(:account).macro
      expect(association).to eq :belongs_to
    end
  end

  describe 'associations' do
    it { should belong_to(:account) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:account_id) }
    it { should validate_presence_of(:note) }
  end

end

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Associations' do
    it 'belongs_to catagory' do
      association = described_class.reflect_on_association(:catagory).macro
      expect(association).to eq :belongs_to
    end

    it 'has_many tickets' do
      association = described_class.reflect_on_association(:tickets).macro
      expect(association).to eq :has_many
    end
  end

  describe 'associations' do
    it { should belong_to(:catagory) }
    it { should have_many(:tickets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number_of_tickets) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:catagory_id) }
  end

end

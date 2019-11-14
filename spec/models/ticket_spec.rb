require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'Associations' do
    it 'belongs_to event' do
      association = described_class.reflect_on_association(:event).macro
      expect(association).to eq :belongs_to
    end

    it 'belongs_to purchaser' do
      association = described_class.reflect_on_association(:purchaser).macro
      expect(association).to eq :belongs_to
    end
  end

  describe 'associations' do
    it { should belong_to(:event) }
    it { should belong_to(:purchaser).class_name('User') }
  end

end

require 'rails_helper'

RSpec.describe Company, type: :model do

  describe 'Default Values' do
    subject { FactoryBot.create(:company) }

    it 'create company and set default values' do
      expect(subject.active).to eq(true)
    end
  end
end

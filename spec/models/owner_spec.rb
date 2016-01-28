require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe 'Owner class methods' do
    it 'has new_remember_token method' do
      expect(Owner).to respond_to :new_remember_token
    end

    it 'has digest method' do
      expect(Owner).to respond_to :digest
    end
  end

  describe Owner do
    it { is_expected.to respond_to :login }
    it { is_expected.to respond_to :password }
    it { is_expected.to respond_to :password_confirmation }
  end
end

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context 'Userモデル(followed)との関係' do
      let(:target) { :followed }
      
      it 'N:1になっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
    
    context 'Userモデル(follower)との関係' do
      let(:target) { :follower }
      
      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
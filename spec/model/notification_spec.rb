require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context 'Userモデル(visiter)との関係' do
      let(:target) { :visiter }
      
      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
    
    context 'Userモデル(visited)との関係' do
      let(:target) { :visited }
      
      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
    
    context 'roomモデルとの関係' do
      let(:target) { :room }
      
      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
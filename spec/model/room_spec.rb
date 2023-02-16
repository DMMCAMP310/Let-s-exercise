require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context 'Memberモデルとの関係' do
      let(:target) { :members }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    
    context 'chatモデルとの関係' do
      let(:target) { :chats }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    
    context 'Notificationモデルとの関係' do
      let(:target) { :notifications }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
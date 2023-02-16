require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe 'バリデーションのテスト' do
    subject { chat.valid? }
    
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:chat) { build(:chat, user_id: user.id, room_id: room.id) }
    
    context 'messageカラム' do
      it '空白でないこと' do
        chat.message = ''
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context 'Userモデルとの関係' do
      let(:target) { :user }
      
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
    
    context 'Notificationモデルとの関係' do
      let(:target) { :notifications }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
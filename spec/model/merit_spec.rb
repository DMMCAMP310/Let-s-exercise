require 'rails_helper'

RSpec.describe Merit, type: :model do
  describe 'バリデーションテスト' do
    subject { merit.valid? }
    
    let(:user) { create(:user) }
    let(:merit) { build(:merit, user_id: user.id) }
    
    context 'titleカラム' do
      it '空欄ではないこと' do
        merit.title = ''
        expect(merit.valid?).to eq false
      end
      it '60文字以下であること: 60文字は〇' do
        merit.title = Faker::Lorem.characters(number: 60)
        is_expected.to eq true
      end
      it '60文字以下であること: 61文字は×' do
        merit.title = Faker::Lorem.characters(number: 61)
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
  end
end
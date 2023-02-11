require 'rails_helper'

RSpec.describe Cause, type: :model do
  describe 'バリデーションテスト' do
    subject { cause.valid? }
    
    let(:user) { create(:user) }
    let(:cause) { build(:cause, user_id: user.id) }
    
    context 'titleカラム' do
      it '空欄ではないこと' do
        cause.title = ''
        expect(cause.valid?).to eq false
      end
      it '60文字以下であること: 60文字は〇' do
        cause.title = Faker::Lorem.characters(number: 60)
        is_expected.to eq true
      end
      it '60文字以下であること: 61文字は×' do
        cause.title = Faker::Lorem.characters(number: 61)
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
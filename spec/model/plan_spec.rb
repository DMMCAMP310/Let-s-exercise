require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'バリデーションテスト' do
    subject { plan.valid? }
    
    let(:user) { create(:user) }
    let(:plan) { build(:plan, user_id: user.id) }
    
    context 'titleカラム' do
      it '空欄ではないこと' do
        plan.title = ''
        expect(plan.valid?).to eq false
      end
      it '60文字以下であること: 60文字は〇' do
        plan.title = Faker::Lorem.characters(number: 60)
        is_expected.to eq true
      end
      it '60文字以下であること: 61文字は×' do
        plan.title = Faker::Lorem.characters(number: 61)
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
    context 'Week_Enableモデルとの関係' do
      let(:target) { :week_enables }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Weekモデルとの関係' do
      let(:target) { :weeks }
      
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) { create(:user) }
    let(:user_2) { create(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '空欄ではないこと' do
        user.introduction = ''
        is_expected.to eq false
      end
    end
    
    context 'ageカラム' do
      it '空欄ではないこと' do
        user.age = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Trainingモデルとの関係' do
      let(:target) { :trainings }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      let(:target) { :likes }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Training_commentモデルとの関係' do
      let(:target) { :training_comments }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Relationshipモデル(reverse_of_relationships)との関係' do
      let(:target) { :relationships }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはRelationship' do
        expect(association.class_name).to eq 'Relationship'
      end
    end
    context 'Reportモデルとの関係' do
      let(:target) { :reports }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context '中間テーブルMemberモデルとの関係' do
      let(:target) { :members }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Chatモデルとの関係' do
      let(:target) { :chats }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context
  end
end

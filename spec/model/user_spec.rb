require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) { create(:user) }
    let(:user_2) { create(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.name = Faker::Lorem.characters(number: 11)
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
    context 'Relationshipモデルとの関係' do
      let(:target) { :relationships }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはRelationship' do
        expect(association.class_name).to eq 'Relationship'
      end
    end
    context 'Relationshipモデル(reverse_of_relationships)との関係' do
      let(:target) { :reverse_of_relationships }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはRelationship' do
        expect(association.class_name).to eq 'Relationship'
      end
    end
    context '自分がフォローしているユーザーとの関連（自己結合型多対多)' do
      let(:target) { :followings }
      it '1:Nとなっている(中間テーブルrelationshipsを介すので自己結合型多対多)' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(Follower)' do
        expect(association.class_name).to eq 'User'
      end
    end
    context '自分がフォローされるユーザーとの関連（自己結合型多対多)' do
      let(:target) { :followers }
      it '1:Nとなっている(中間テーブルreverse_of_relationshipsを介すので自己結合型多対多)' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(Following)' do
        expect(association.class_name).to eq 'User'
      end
    end
    context 'Reportモデルとの関係' do
      let(:target) { :reports }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルクラスはReport' do
        expect(association.class_name).to eq 'Report'
      end
    end
    context 'Report(reverse_of_reports)モデルとの関係' do
      let(:target) { :reverse_of_reports }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルクラスはReport' do
        expect(association.class_name).to eq 'Report'
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
    context 'Planモデルとの関係' do
      let(:target) { :plans }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Enableモデルとの関係' do
      let(:target) { :enables }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Causeモデルとの関係' do
      let(:target) { :causes }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Meritモデルとの関係' do
      let(:target) { :merits }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    context 'Notificationモデル(active_notifications)との関係' do
      let(:target) { :active_notifications }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはNotification' do
        expect(association.class_name).to eq 'Notification'
      end
    end
    context 'Notificationモデル(passive_notifications)との関係' do
      let(:target) { :passive_notifications }
      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはNotification' do
        expect(association.class_name).to eq 'Notification'
      end
    end
  end
end

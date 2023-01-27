require 'rails_helper'

RSpec.describe 'Trainingモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { training.valid? }

    let(:user) {create(:user) }
    let(:training) { build(:training, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        training.name = ''
        is_expected.to eq false
      end
    end

    context 'goalカラム' do
      it '空欄でないこと' do
        training.goal = ''
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄ではないこと' do
        training.introduction = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'Training_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:training_comments).macro).to eq :has_many
      end
    end
    context 'Notificationsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
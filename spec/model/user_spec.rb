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
  end

  describe 'アソシエーションのテスト' do
    context 'Trainingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:trainings).macro).to eq :has_many
      end
    end
  end
end

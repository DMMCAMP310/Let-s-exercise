require 'rails_helper'

RSpec.describe "Public::Users", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:unfollowed_user) { create(:user) }
  
  describe "ユーザー一覧ページを表示（GET #index)" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get users_path
        expect(response).to redirect_to new_user_session_path
      end
    end
    
    context "ログインしている場合" do
      it "リクエストが成功すること" do
        sign_in user
        get users_path
        expect(response).to have_http_status "200"
      end
    end
  end
  
  describe "ユーザー詳細ページを表示（GET #show)" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end
    
    context "ログインしている場合" do
      before do
        sign_in user
      end
      
      context "本人のページの場合" do
        it "リクエストが成功すること" do
          get user_path user.id
          expect(response).to have_http_status "200"
        end
      end
    end
  end
    
    
end
# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
  
    # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def user_state
    @user = User.find_by(email: params[:user][:email])
    #アカウントが確認できなかったらメソッド終了
    return if !@user
    #取得したアカウントのパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      flash[:notice] = "規定違反があったためアカウントを停止しました。"
      redirect_to root_path
    else
      flash[:notice] = "メールアドレスまたはパスワードが一致しませんでした"
    end
  end
end

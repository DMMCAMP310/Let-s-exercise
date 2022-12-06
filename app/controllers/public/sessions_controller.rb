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
  
   # 退会しているかを判断するメソッド
  def user_state
    @user = User.find_by(email: params[:user][:email])
    #アカウントが確認できなかったらメソッド終了
    return if!@user
    #取得したアカウントのパスワードが一致しているかを判別
    if @user.valid_password?(params[:customer][:password]) && (@user.is_deleted == true)
      flash[:notice] = "退会済みです。再度登録をお願いいたします。"
      redirect_to new_user_registration_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end
end

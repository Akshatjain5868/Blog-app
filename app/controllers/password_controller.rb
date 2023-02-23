class PasswordController < ApplicationController
  before_action :user_logged_in? , only: [:reset_password]
  def forgot_password
    if request.post?
      @user = User.find_by_email(params[:email])
      if @user
        new_password = create_random_password
        @user.update(:password=>new_password)
        #action mailer
        UserNotifierMailer.forgot_password_alert(@user).deliver
        redirect_to account_index_url

      else
        flash[:notice] = "Invalid email Id"
        render :action=>forgot_password
      end
    end
  end
  def create_random_password
    (0...6).map {(65 + rand(26)).chr }.join
  end

  def reset_password
    if request.post?
      iden = session[:user]
      @user = User.find_by_id(iden)
      if @user.update(user_params)
        UserNotifierMailer.reset_password_alert(@user).deliver
        redirect_to account_dashboard_url
      else
        render :action=>reset_password
      end
    end
  end

  def user_logged_in?
    if session[:user].nil?
      flash[:notice] = "You need to login as an admin to continue."
      redirect_to account_index_url
    end
  end
  
  def user_params
    params.permit(:password,:password_confirmation)
  end

end

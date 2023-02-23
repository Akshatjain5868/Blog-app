class ProfileController < ApplicationController
  def edit_profile
    @user = User.find(session[:user])
    if request.post?
        if @user.update(profile_params)
          flash[:notice] = "Profile has been edited"
          redirect_to account_dashboard_url
        else
          render :action=>:edit_profile
        end
    end

  end

  def profile_params
    params.permit(:first_name,:last_name,:mobile,:date_of_birth,:profile_image)
  end
end

class UserController < ApplicationController
  def index
    if !user_signed_in?
      flash[:notice] = "Nope, Sign in first"
      redirect_to new_user_session_path and return
    end
  end

  def edit
    if !user_signed_in?
      flash[:notice] = "Nope, Sign in first"
      redirect_to new_user_session_path and return
    end
    @user = User.find(params[:id])
    if @user.nil?
      flash[:notice] = "No user found"
      redirect_to root_path and return
    end
  end

  def update
    if !user_signed_in?
      flash[:notice] = "Nope, Sign in first"
      redirect_to new_user_session_path and return
    end
    @user = User.find(params[:id])
    if update_user_params[:password].empty?
      params.require(:user).delete(:password)
      params.require(:user).delete(:password_confirmation)
      @user.assign_attributes update_user_params
      @user.valid?
      if !@user.errors.any? {|m| m == :email} && !@user.errors.any? {|m| m == :login}
        @user.save(validate: false)
        @user.errors.clear
        flash[:notice] = "Login/Email successfully changed !"
        render action: 'edit'
      else
        flash[:error] = "Could not save changes, please make sure the information entered is correct"
        render action: 'edit'
      end
    else
      if update_user_params[:password] == update_user_params[:password_confirmation]
        @user.assign_attributes update_user_params
        if @user.save
          flash[:alert] = "User successfully changed !"
          redirect_to root_path and return
        else
          if @user.errors.any? {|m| m == :password}
            @errors = []
            @user.errors.each do |err, msg|
              if err == :password
                @errors << {:password_confirmation => msg}
              end
            end
            @errors.each do |err|
              @user.errors.add(err.first[0].to_sym, err.first[1])
            end
          end
          flash[:error] = "Could not save changes, please make sure the information entered is correct"
          render action: 'edit'
        end
      else
        @user.errors.add(:password, "Passwords do not match")
        @user.errors.add(:password_confirmation, "Passwords do not match")
        flash[:error] = "Could not save changes, passwords do not match"
        render action: 'edit'
      end
    end
  end

  protected

  def update_user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController
  before_action :find_user ,only:[:show , :edit , :update , :destroy, :profile,:profile_update]  
  
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.create(user_params)
    if @users.valid?
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:errors] = "User Updated Successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def profile
  end
  
  def profile_update
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "User Updated Successfully"
      else
        flash[:errors] = @user.errors.full_messages
      end
      format.js
    end
  end

  def changepassword
    @password_change = User.find(params[:id])
  end

  def changepassword_update
    @user = User.find(params[:id])
    if @user.update_attribute(:password, params[:new_password])
      flash[:notice] = "Password updated successfully"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to changepassword_js_user_path(@user)
    end
  end

  def destroy
    if @user.delete
      flash[:errors] = "User Deleted Successfully"
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to destroy_user_path
    end      
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name ,:email ,:password ,:subscription,:subscription_email)
  end

  def find_user
    @user = User.find(params[:id])
  end  
end

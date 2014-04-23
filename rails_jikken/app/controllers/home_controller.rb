class HomeController < ApplicationController
  def top
    @user = User.new
  end

  def login
    @user = User.find_by(:name => params[:user][:name])
    if @user.nil?
      @user = User.new(:name => params[:user][:name])
      render :register and return
    else
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to :my_page
      else
        flash[:notice] = "invalid PW"
        redirect_to :top
      end
    end
  end

  def register
    user = User.create(
      params.require(:user).permit(:name, 
                                   :password, 
                                   :password_confirmation))
    session[:user_id] = user.id
    redirect_to :my_page
  end

  def my_page
    @user = current_user
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end
end

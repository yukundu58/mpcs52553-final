class UsersController < ApplicationController

  def update
    if session["user_id"].blank?
      redirect_to "/login"
    else
      @user = User.find_by(id: session["user_id"])
      @user.password = params["password"]
      @user.email = params["email"]
      @user.first_name = params["first_name"]
      @user.last_name = params["last_name"]
      @user.email = params["email"]
      @user.save
      if @user.save
        flash[:success] = "Update successfully"
        redirect_to "/"
      else
        flash[:danger] = @user.errors.full_messages
        redirect_to "/users/new"
      end
    end
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/users"
  end

  def edit
    if session["user_id"].blank?
      flash[:danger] = "Please Log in firstly"
      redirect_to "/login"
    else
      @user = User.find_by(id: session["user_id"])
      render "edit"
    end
  end


  def create
    if params["admin_code"] != nil and params["admin_code"] == "52553"
      User.create :username => params["username"], :password => params["password"],
                  :first_name => params["first_name"], :last_name => params["last_name"],
                  :email => params["email"], :is_admin => true
    else
      User.create :username => params["username"], :password => params["password"],
                  :first_name => params["first_name"], :last_name => params["last_name"],
                  :email => params["email"]
    end
    flash[:success] = "Sign Up successfully"
    redirect_to "/"
  end

  def index
    if session["user_id"].blank?
      redirect_to "/login"
    else
      @user = User.find_by(id: session["user_id"])
    end
  end

end

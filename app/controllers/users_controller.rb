class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })
    render({ :template => "/user_templates/users.html.erb" })
  end

  def show_detail
    @user_name = params.fetch("name")
    @user = User.where({ :username => @user_name }).at(0)
    if (!@user)
      redirect_to("/404")
    else
      render({ :template => "/user_templates/user_detail.html.erb" })
    end
  end

  def create
    new_user = User.new
    new_user.username = params.fetch("username")
    new_user.save

    redirect_to("/users/#{new_user.username}")
  end

  def update
    username = params.fetch("username")
    user = User.where({ :username => username }).at(0)
    user.username = params.fetch("edit_name")
    user.save
    redirect_to("/users/#{user.username}")
  end
end

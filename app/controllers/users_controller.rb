class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Rejestracja"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
	sign_in @user
	flash[:success] = "Witaj! Dziekuje za rejestracje"
	redirect_to @user
    else
      @title = "Rejestracja"
      render 'new'
    end
  end

end

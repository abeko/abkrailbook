#coding: utf-8

class LoginController < ApplicationController
  skip_before_filter :check_logined, :except => 'index'
  
  def index
    flash[:referer] = request.headers['Referer']
  end
  
  def auth
    usr = User.auhenticate(params[:username], params[:password])
    if usr then
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザー名／パスワードが間違っています。'
      render 'index'
    end
  end
  
  def logout
    reset_session
    redirect_to request.headers['Referer']
  end
end

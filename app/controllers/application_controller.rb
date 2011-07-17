class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_logined
  
  private
  def check_logined
    if session[:usr] then
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
  end
end

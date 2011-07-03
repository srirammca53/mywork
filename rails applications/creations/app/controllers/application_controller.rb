class ApplicationController < ActionController::Base
  protect_from_forgery
 
  private
 
  def authenticate
    authenticate do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end

private

  def catch_exceptions
    yield
  rescue => exception
    logger.debug "Caught exception! #{exception}" 
    raise
  end

 
end

class ApplicationController < ActionController::Base
#layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

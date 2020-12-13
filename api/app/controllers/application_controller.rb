class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Knock::Authenticable

  def current_ability
    @current_ability ||= Ability.new(current_user)
                         
  end

  protected

  def auth_user
    authenticate_user
  end

  
end

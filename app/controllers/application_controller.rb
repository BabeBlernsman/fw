class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def to_french
    current_user.update_attributes(language: "fr") if current_user
    redirect_to root_path
  end

  def to_english
    current_user.update_attributes(language: "en") if current_user
    redirect_to root_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def set_locale
    if current_user
      I18n.locale = current_user.language || I18n.default_locale
    else
      I18n.locale = I18n.default_locale
    end
  end
end
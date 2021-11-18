# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    puts 'set_locale'
    cookies[:lng] = params[:lng] if params[:lng]
    I18n.locale = cookies[:lng] if cookies[:lng] && (I18n.locale != cookies[:lng])
  end
end

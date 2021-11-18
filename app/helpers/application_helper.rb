# frozen_string_literal: true

module ApplicationHelper

  def rails_env
    if Rails.env.development?
      'Desenvolvimento'
    elsif Rails.env.production?
      'Produção'
    else
      'Teste'
    end
  end

  def locale
    I18n.locale == :en ? 'USA' : 'BRBRBRBRBR'
  end
end

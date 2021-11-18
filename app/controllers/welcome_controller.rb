# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    puts params
    @nome = params[:nome]
    @curso = params[:curso]

    #session[:curso] = @curso

    #cookies[:curso] = @curso
    #cookies[:nome] = @nome

=begin
    cookies.each do |c|
      puts c
    end
=end

=begin

    session.each do |s|
      puts s
    end
=end

  end
end

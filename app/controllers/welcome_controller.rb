class WelcomeController < ApplicationController
  def index
    puts params
    @nome  = params[:nome]
    @curso  = params[:curso]
  end
end

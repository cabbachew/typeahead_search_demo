class SearchesController < ApplicationController
  def home
  end

  def index
    @messages = Message.containing(params[:query]) # Scope defined on Message model
  end
end

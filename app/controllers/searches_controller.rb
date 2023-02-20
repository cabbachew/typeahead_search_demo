class SearchesController < ApplicationController
  def index
    @messages = Message.containing(params[:query]) # Scope defined on Message model
  end
end

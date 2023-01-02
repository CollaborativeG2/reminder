class RemaindersController < ApplicationController
      # GET /users or /users.json
  def index
    @remainders = RemaindItem.all
  end

end
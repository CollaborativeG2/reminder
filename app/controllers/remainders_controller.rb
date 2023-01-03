class RemaindersController < ApplicationController
      # GET /Remainders or /Remainders.json
  def index
    @remainders = RemaindItem.all
  end
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @remainder = RemaindItem.new
  end

  # GET /users/1/edit
  def edit
  end

    def create
    end
    
      def update
      end
    
      def destroy
      end

end
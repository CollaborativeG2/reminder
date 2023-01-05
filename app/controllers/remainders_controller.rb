class RemaindersController < ApplicationController

  def index
    @remainders = RemaindItem.all
  end

  def show
  end

  def new
    @remaind_item = RemaindItem.new
    @remaind = Remaind.new
  end

  def edit
  end

  def create
    remaind_item=RemaindItem.new(remaind_item_params)
    remaind_item.user = User.first
    remaind_item.remainds.build(remaind_params)
    respond_to do |format|
      if remaind_item.save
        format.html { redirect_to remainders_url, notice: "remainders was successfully created." }
       # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
       # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end
    
  def destroy
  end

  private
    def remaind_item_params
        params.require(:remaind_item).permit(:description)
    end
    
    def remaind_params
      params.require(:remaind).permit(:remaind_at)
    end 
end
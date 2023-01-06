class RemindersController < ApplicationController

  def index
    @reminders = RemindItem.all
  end

  def show
  end

  def new
    @remind_item = RemindItem.new
    @remind = Remind.new
  end

  def edit
  end

  def create
    remind_item=RemindItem.new(remind_item_params)
    remind_item.user_id=1
    remind_item.reminds.build(remind_params)
    respond_to do |format|
      if remind_item.save
        format.html { redirect_to reminders_url, notice: "reminders was successfully created." }
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
    def remind_item_params
        params.require(:remind_item).permit(:description)
    end
    
    def remind_params
      params.require(:remind).permit(:remind_at)
    end 
end
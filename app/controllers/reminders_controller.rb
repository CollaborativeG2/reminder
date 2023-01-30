class RemindersController < ApplicationController
  before_action :logged_in_user

  def index
    @reminders = RemindItem.where(user: current_user)
  end

  def show
    @reminder = RemindItem.find(params[:id])
    @remind = @reminder.reminds.first
  end


  def new
    @remind_item = RemindItem.new
    @remind = Remind.new
  end

  def edit
  end

  def create
    remind_item = RemindItem.new(remind_item_params)
    remind_item.user = current_user
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
    remind = Remind.find(params[:id])
    respond_to do |format|
      if remind.update(remind_params)
        format.html { redirect_to reminders_url, notice: "reminders was successfully edited." }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    remind_item = RemindItem.find(params[:id])
    remind_item.destroy

    respond_to do |format|
      format.html { redirect_to reminders_url, notice: "Task was successfully destroyed." }

    end
  end

  private
    def remind_item_params
        params.require(:remind_item).permit(:description)
    end
    
    def remind_params
      params.require(:remind).permit(:remind_at)
    end 
end
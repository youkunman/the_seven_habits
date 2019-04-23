class ExperiencesController < ApplicationController
  before_action :set_habit

  def index
  	@users = User.all
  end

  def show
  end

  def create
  	  @habit = Habit.find(params[:habit_id])
  	  experience = current_user.experiences.new(habit_id: @habit.id)
  	  experience.save
  	  redirect_to user_path(current_user.id)
  end

  def destroy
      @habit = Habit.find(params[:habit_id])
      experience = @habit.experiences_user(current_user.id)
      experience.destroy
      redirect_to user_path(current_user.id)

  end

  private
  def habit_params
    params.require(:experience).permit(:habit_id,:user_id,:created_at)
  end
  def set_habit
    @habit = Habit.find(params[:habit_id])
  end
end





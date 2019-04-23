class HabitsController < ApplicationController
  before_action :correct_admin_user, only: [:edit, :update]

  def index
    @users = User.all.where('users.id > ?', 1).joins(:experiences).includes(:experiences).group(:user_id).order("count(experiences.id) DESC")
    # binding.pry
    @today_range = Date.today.beginning_of_day..Date.today.end_of_day
    @todays = User.where('users.id > ?', 1).joins(:experiences).group(:user_id).where(:experiences => {created_at: @today_range}).order("count(experiences.id) DESC")
    @week_range = Date.today.beginning_of_week..Date.today.end_of_week
    @weeks = User.where('users.id > ?', 1).joins(:experiences).group(:user_id).where(:experiences => {created_at: @week_range}).order("count(experiences.id) DESC")
  end

  def create
      @user = current_user
      @experiences = []
      @habit = Habit.new
      @habits = @user.habits.all
      @habits.each do |habit|
        ex = habit.experiences.all
        if ex.count > 0 then
          ex.each do |e|
            @experiences.push(e)
          end
        end
      end
      @habit = Habit.new(habit_params)
      @habit.user_id = current_user.id
      if @habit.save
         redirect_to user_path(current_user.id)
      else
          render 'users/show'
      end
  end

  def edit
      @habit = Habit.find(params[:id])
  end

  def update
      @habit = Habit.find(params[:id])
      if @habit.update(habit_params)
         redirect_to user_path(current_user.id)
      else
         render "edit"
      end
  end

  def destroy
      @habit = Habit.find(params[:id])
      @habit.destroy
      redirect_to user_path(current_user.id)
  end

  private
  def habit_params
    params.require(:habit).permit(:habit_name)
  end

    def correct_admin_user
      habit = Habit.find(params[:id])
      if (current_user != habit.user) and (current_user.id != 1)
          redirect_to users_path
      end
    end

end










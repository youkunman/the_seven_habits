class UsersController < ApplicationController
  before_action :correct_admin_user, only: [:edit, :update, :destroy]
  # before_action :admin_user, only: [:edit, :update, :destroy]


  def index
      @users = User.where('users.id > ?', 1).page(params[:page]).reverse_order
  end

  def show
      @user = User.find(params[:id])
      @habits = @user.habits.all
      @habit = Habit.new
      @experiences = []
      @habits.each do |habit|
        ex = habit.experiences.all
        if ex.count > 0 then
          ex.each do |e|
            @experiences.push(e)
          end
        end
      end


  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(current_user.id)
      else
         render "edit"
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
  end

  private
    def user_params
        params.require(:user).permit(:name, :email,:gender,:profession,:hobby,:introduction,:image)
    end

    # def admin_user
    #   redirect_to(root_url) unless current_user.admin?
    # end

    def correct_admin_user
      user = User.find(params[:id])
      admin_user = User.find(1)
      if (current_user != user) and (current_user != admin_user)
         redirect_to users_path
      end

    end

    # def admin_user
    #   admin_user = User.find(1)
    #   if current_user != user
    #      redirect_to users_path
    #   end
    # end

    # def check_admin?
    #   !current_user.admin?
    # end

end













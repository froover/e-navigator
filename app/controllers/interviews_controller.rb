class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /users/:user_id/interviews
  def index
    @user = User.find(params[:user_id])
    @interviews = current_user.interviews
  end

  # GET /users/:user_id/interviews/:id
  def show
    @user = User.find(params[:user_id])
  end

  # GET /users/:user_id/interviews/:id/new
  def new
    @user = current_user
    @interview = Interview.new
  end

  # GET /users/:user_id/interviews/:id/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /users/:user_id/interviews
  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user
    @user = current_user
    if @interview.save
      redirect_to user_interview_url(@user,@interview), notice: '面接日程が作成されました。'
    else
      render :new
    end
  end


  # PATCH/PUT /users/:user_id/interviews/:id
  def update
    if @interview.update(interview_params)
      redirect_to user_interview_url, notice: '面接日程が更新されました。'
    else
      render :edit
    end
  end

  # DELETE /users/:user_id/interviews/:id
  def destroy
    @interview.destroy
    redirect_to user_interview_url, notice: '面接日程が削除されました。'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = Interview.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_params
    params.require(:interview).permit(:interview_date, :approval)
  end
end

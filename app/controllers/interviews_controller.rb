class InterviewsController < ApplicationController
  before_action :set_user, except: :destroy
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /users/:user_id/interviews
  def index
    @interviews = current_user.interviews
  end

  # GET /users/:user_id/interviews/:id
  def show
  end

  # GET /users/:user_id/interviews/:id/new
  def new
    @user = current_user
    @interview = Interview.new
  end

  # GET /users/:user_id/interviews/:id/edit
  def edit
  end

  # POST /users/:user_id/interviews
  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user
    @user = current_user
    if @interview.save
      redirect_to user_interview_url(@user, @interview), notice: '面接日程が作成されました。'
    else
      render :new
    end
  end


  # PATCH/PUT /users/:user_id/interviews/:id
  def update
    if @user == current_user
      if @interview.update(interview_params)
        @interview.hold!
        redirect_to user_interviews_url, notice: '面接候補日を更新しました'
      else
        render :edit
      end
    else
      @interview.approved!
      @user.interviews.where.not(id: @interview.id).update_all(approval: :rejected)
      redirect_to user_interviews_url, notice: '面接日を設定しました'
    end
  end

  # DELETE /users/:user_id/interviews/:id
  def destroy
    @interview.destroy
    redirect_to user_interviews_url, notice: '面接日程が削除されました。'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = Interview.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_params
    params.require(:interview).permit(:interview_date, :approval)
  end
end

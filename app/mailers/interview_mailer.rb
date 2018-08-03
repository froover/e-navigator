class InterviewMailer < ApplicationMailer

  def send_when_confirm(user, current_user, interview)
    @user = user
    @current_user = current_user
    @interview = user.interviews.find_by(approval: "approved")&.interview_date&.to_s(:datetime)
    mail to: @user.email, subject: "面接日が確定しました"
  end
end

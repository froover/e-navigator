class InterviewMailer < ApplicationMailer

  def send_when_application(user, current_user)
    @user = user
    @current_user = current_user
    mail to: @current_user.email, subject: "面接希望日の申請がありました"
  end

  def send_when_confirm(user, current_user, interview)
    @user = user
    @current_user = current_user
    @interview = user.interviews.find_by(approval: "approved")&.interview_date&.to_s(:datetime)
    mail to: [@user.email, @current_user.email], subject: "面接日が確定しました"
  end
end

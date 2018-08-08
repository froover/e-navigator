class InterviewMailer < ApplicationMailer

  def send_when_application(interviewee, interviewer)
    @interviewee = interviewee
    @interviewer = interviewer
    mail to: @interviewer.email, subject: "面接希望日の申請がありました"
  end

  def send_when_confirm(interviewee, interviewer, interview)
    @interviewee = interviewee
    @interviewer = interviewer
    @interview = user.interviews.find_by(approval: "approved")&.interview_date&.to_s(:datetime)
    mail to: [@interviewee.email, @interviewer.email], subject: "面接日が確定しました"
  end
end

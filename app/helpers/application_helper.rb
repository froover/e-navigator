module ApplicationHelper
  def interview_datetime(interview_date)
    interview_date.strftime("%Y年%m月%d日 %H時%M分")
  end
end

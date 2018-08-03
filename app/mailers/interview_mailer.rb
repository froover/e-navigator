class InterviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.interview_mailer.send_when_confirm.subject
  #
  def send_when_confirm
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

class IssueMailer < ActionMailer::Base
  default from: ENV['MAIL_FROM']

  def notify_subscribers(issue:, subscriber:)
    @issue = issue
    @subscriber = subscriber

    mail to: @subscriber.email, subject: "[Newsletter] #{@issue.title}"
  end
end

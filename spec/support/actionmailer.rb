RSpec.configure do |config|
  ActionMailer::Base.perform_deliveries = true

  config.after(:each) { ActionMailer::Base.deliveries.clear }
end

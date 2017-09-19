require 'rails_helper'

RSpec.describe SendEmailJob, type: :job do
  it "calls the UserMailer method" do
    user = create(:user)
    ActiveJob::Base.queue_adapter = :test
    expect {
      SendEmailJob.perform_later(user)
    }.to have_enqueued_job(SendEmailJob)
  end
end

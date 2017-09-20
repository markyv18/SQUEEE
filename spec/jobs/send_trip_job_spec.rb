require 'rails_helper'

RSpec.describe SendTripJob, type: :job do
  it "calls the UserMailer method" do
    trip = create(:trip)
    ActiveJob::Base.queue_adapter = :test
    expect {
      SendTripJob.perform_later(trip)
    }.to have_enqueued_job(SendTripJob)
  end
end


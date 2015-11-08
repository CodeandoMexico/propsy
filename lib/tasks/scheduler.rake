desc "Updates status on pending tasks"
task update_states: :environment do
  Support.where(status: [:working, :queued]).map{|support| support.fetch_status }
end
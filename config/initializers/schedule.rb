require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1d' do
  system("rake todo:delete_items")
  puts 'Expired todo items deleted'
end

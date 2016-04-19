set :output, "/log/cron.log"

every 1.minute do
  rake "todo:delete_items"
end
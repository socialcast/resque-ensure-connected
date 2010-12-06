require 'active_record'

Resque.after_fork do |job|
  begin
    puts 'here'
    puts ActiveRecord::Base.connection_handler.inspect
    ActiveRecord::Base.connection_handler.verify_active_connections!
    puts 'after'
  rescue => e
    puts e.inspect
  end
end

require 'bunny'

connectionString = "amqps://admin:Testing123456!@b-cd8f72ea-8583-4aef-8ea6-8e9dec24f4b8.mq.ca-central-1.on.aws:5671"
connection = Bunny.new(connectionString)


connection.start

channel = connection.create_channel
queue = channel.queue('Hello')

begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts body
    end
rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end
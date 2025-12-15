require 'mqtt'



host = 'mqtts://admin:Testing123456!@b-3396096c-7136-4de0-9cef-76cc5988ed4a-1.mq.ca-central-1.amazonaws.com:8883'
topic  = 'test/topic'
message = "Hello World! MQTT"

begin
    MQTT::Client.connect(host) do |client|
        client.publish(topic, message)
    end
rescue => e
    puts e.inspect
end
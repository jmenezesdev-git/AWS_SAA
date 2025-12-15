require 'stomp'

login = "admin"
passcode = "Testing123456!"
host = "b-3396096c-7136-4de0-9cef-76cc5988ed4a-1.mq.ca-central-1.amazonaws.com"
port = 61614

config = {
    hosts: [
        login: login,
        passcode: passcode,
        host: host,
        port: port,
        ssl: true
    ]
}

# connectionString = "stomp+ssl://admin:Testing123456!@b-3396096c-7136-4de0-9cef-76cc5988ed4a-1.mq.ca-central-1.amazonaws.com:61614"

# client = Stomp::Client.new(connectionString)
client = Stomp::Client.new(config)

dest = '/queue/test'
client.subscribe(dest) do |message|
    puts 'subbed'
    puts message
    client.acknowledge(message)
end
client.join
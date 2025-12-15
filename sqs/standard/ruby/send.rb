require 'aws-sdk-sqs'

client = Aws::SQS::Client.new



resp = client.send_message({
  queue_url: ENV['QUEUE_URL'], # required
  message_body: "Hello from Ruby!", # required
  delay_seconds: 1,
  message_attributes: {
    "FavoriteColor" => {
      string_value: "Green",
      data_type: "String", # required
    }
  }
})

# resp.md5_of_message_body #=> String
# resp.md5_of_message_attributes #=> String
# resp.md5_of_message_system_attributes #=> String
# resp.message_id #=> String
# resp.sequence_number #=> String
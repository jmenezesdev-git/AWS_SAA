require 'aws-sdk-sqs'
require 'pry'

client = Aws::SQS::Client.new


resp = client.receive_message({
  queue_url: ENV['QUEUE_URL'], # required
  attribute_names: ["All"], # accepts All, Policy, VisibilityTimeout, MaximumMessageSize, MessageRetentionPeriod, ApproximateNumberOfMessages, ApproximateNumberOfMessagesNotVisible, CreatedTimestamp, LastModifiedTimestamp, QueueArn, ApproximateNumberOfMessagesDelayed, DelaySeconds, ReceiveMessageWaitTimeSeconds, RedrivePolicy, FifoQueue, ContentBasedDeduplication, KmsMasterKeyId, KmsDataKeyReusePeriodSeconds, DeduplicationScope, FifoThroughputLimit, RedriveAllowPolicy, SqsManagedSseEnabled
  message_attribute_names: ["FavoriteColor"],
  max_number_of_messages: 1,
  visibility_timeout: 1,
  wait_time_seconds: 1
})

resp.messages.each do |message|
    puts message.receipt_handle
    puts message.body
    puts message.message_attributes["FavoriteColor"].string_value
    handle = message.receipt_handle
    resp2 = client.delete_message({
        queue_url: ENV['QUEUE_URL'],
        receipt_handle: handle
    })
end




# resp.messages #=> Array
# resp.messages[0].message_id #=> String
# resp.messages[0].receipt_handle #=> String
# resp.messages[0].md5_of_body #=> String
# resp.messages[0].body #=> String
# resp.messages[0].attributes #=> Hash
# resp.messages[0].attributes["MessageSystemAttributeName"] #=> String
# resp.messages[0].md5_of_message_attributes #=> String
# resp.messages[0].message_attributes #=> Hash
# resp.messages[0].message_attributes["String"].string_value #=> String
# resp.messages[0].message_attributes["String"].binary_value #=> String
# resp.messages[0].message_attributes["String"].string_list_values #=> Array
# resp.messages[0].message_attributes["String"].string_list_values[0] #=> String
# resp.messages[0].message_attributes["String"].binary_list_values #=> Array
# resp.messages[0].message_attributes["String"].binary_list_values[0] #=> String
# resp.messages[0].message_attributes["String"].data_type #=> String
require 'aws-sdk-comprehend'
require 'pry'

# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Comprehend/Client.html#detect_dominant_language-instance_method
client = Aws::Comprehend::Client.new
text = "Hello World! This is Ethereal, doing an awful test with Comprehend. I hate this service!"

resp = client.detect_sentiment({
    text: text,
    language_code: 'en'
})
#binding.pry
puts resp.sentiment

# correctly outputs negative sentiment
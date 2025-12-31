require 'aws-sdk-polly'
require 'pry'

client = Aws::Polly::Client.new

# Synthesizes plain text or SSML into a file of human-like speech.

resp = client.synthesize_speech({
  engine: "standard",
  output_format: "mp3", 
  sample_rate: "22050", 
  text: "All Gaul is divided into three parts", 
  text_type: "text", 
  voice_id: "Joanna", 
})

# w mode has issues (windows?) (wb/write binary works)

File.open('output.mp3', 'wb') do |file|
    data = resp.audio_stream.read
    file.write data
end
# resp.to_h outputs the following:
# {
#   audio_stream: "TEXT", 
#   content_type: "audio/mpeg", 
#   request_characters: 37, 
# }
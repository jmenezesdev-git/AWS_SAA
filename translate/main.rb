require 'aws-sdk-translate'
require 'pry'

client = Aws::Translate::Client.new


text = "Hello, this is Jo, utilizing Amazon Translate."
resp = client.translate_text({
  text: text, # required
  source_language_code: "en", # required
  target_language_code: "ja", # required
})

puts rep.translated_text
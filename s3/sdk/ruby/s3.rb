require 'aws-sdk-s3'
require 'pry'                       # Debugger
require 'securerandom'              # RNG

bucket_name = ENV['BUCKET_NAME']    # How environment variables are called in ruby
region = 'ca-central-1'


client = Aws::S3::Client.new        #Need to create/use an instance of AWS:S3 Client

resp = client.create_bucket({       #Creating S3 Bucket
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region 
  } 
})
#binding.pry

number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

number_of_files.times.each do |i|   # Create and upload files iteratively
    puts "i: #{i}"
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"
    File.open(output_path, "w") do |f|
        f.write SecureRandom.uuid
    end

    File.open(output_path, 'rb') do |f|
        client.put_object(
            bucket: bucket_name,
            key: filename,
            body: f)
    end
end
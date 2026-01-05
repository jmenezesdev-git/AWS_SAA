require 'aws-sdk-textract'
require 'pry'

client  = Aws::Textract::Client.new

bucket = "eth-textract-1254"
filename = "faket4.png"

resp = client.analyze_document({
  document: { # required
    # bytes: "data",
    s3_object: {
      bucket: bucket,
      name: filename,
      #version: "S3ObjectVersion",
    },
  },
  feature_types: ["TABLES"], # required, accepts TABLES, FORMS, QUERIES, SIGNATURES, LAYOUT

})

binding.pry
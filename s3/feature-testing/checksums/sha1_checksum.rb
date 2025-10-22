require "digest"
require 'base64'

puts Base64.strict_encode64(Digest::SHA1.file("testfile.txt").to_s)
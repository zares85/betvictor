require_relative 'autoload'
require 'open-uri'

# Save the file locally for performance reasons
source = open(Betvictor::Config.sourceurl)
file = open(Betvictor::Config.filepath, 'w')
file.write(source.read)
puts "File updated at " + Time.now.getutc.iso8601
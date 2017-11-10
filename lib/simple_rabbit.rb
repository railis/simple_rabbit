require "bunny"

BASE_PATH = File.dirname(__FILE__) + "/simple_rabbit/"

[
  "connection",
  "consumer_worker",
  "publisher"
].each do |utility|
  require BASE_PATH + utility
end

module SimpleRabbit
  class ConnectionNotEstablished < StandardError; end
end

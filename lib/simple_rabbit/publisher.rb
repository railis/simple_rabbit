module SimpleRabbit

  class Publisher

    def self.publish(queue_name, message)
      raise ConnectionNotEstablished unless $simplerabbit_connection
      queue = $simplerabbit_channel.queue(queue_name, durable: true)
      queue.publish(message, persistent: true)
    end

  end

end

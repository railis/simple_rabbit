module SimpleRabbit

  class ConsumerWorker

    def self.run(queue_name, &block)
      raise ConnectionNotEstablished unless $simplerabbit_connection
      queue = $simplerabbit_channel.queue(queue_name, durable: true)
      begin
        puts " [*] Waiting for messages. To exit press CTRL+C"
        queue.subscribe(block: true, manual_ack: true) do |delivery_info, properties, body|
          begin
            block.call(body)
            $simplerabbit_channel.ack(delivery_info.delivery_tag)
          rescue => e
            puts "\n\n#{e.message}\n\n#{e.backtrace.join("\n")}\n\n"
          end
        end
      rescue Interrupt => _
        exit(0)
      end
    end

  end

end

module SimpleRabbit

  class Connection

    def self.get(opts = {})
      $simplerabbit_connection ||=
        begin
          conn = Bunny.new(opts)
          conn.start
          conn
        end
      $simplerabbit_channel ||= $simplerabbit_connection.create_channel
    end

  end

end

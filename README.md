# SimpleRabbit

Simple utility to send / consume messages via RabbitMQ, based on [ruby-amqp/bunny](https://github.com/ruby-amqp/bunny) ruby gem.

## Installation


Add this line to your application's Gemfile:

    gem 'simple_rabbit'

And then execute:

    $ bundle install

Or install it manually:

    $ gem install simple_rabbit

## Usage

### Establishing connection:

To establish connection run this once. It can go to any kind of initializer script.

```ruby
SimpleRabbit::Connection.get(user: "rabbitmquser", pass: "rabbitpass", host: "localhost:5672")
```

It accepts all configuration params available in *Bunny* gem.

### Publishing message

Once connection has been established you can run following to publish message to queue called 'sample_queue'.


```ruby
SimpleRabbit::Publisher.publish("sample_queue", "This is the message body")
```

It creates durable queue, that gets initialized on demand.

### Creating consumer worker

To create consumer worker that reacts to messages published in 'sample_queue' define worker as below:

```ruby
SimpleRabbit::ConsumerWorker.run("sample_queue") do |message|
  puts "Hey I've received message with body: '#{message}'"
  # do sth
end
```

All workers are set to use manual acknowledgement, so in other words if worker fails with some sort of exception, the message can be handled by different worker.

Gem::Specification.new do |s|
  s.authors = ["Dominik Sito"]
  s.email = "dominik.sito@gmail.com"
  s.homepage = "https://github.com/railis/simple_rabbit"

  s.name = "simple_rabbit"
  s.version = "1.0.0"
  s.date = '2017-11-10'
  s.summary = "Simple Rabbit"
  s.description = "Ruby gem allowing simple RabbitMQ message sending and consuming"

  s.files = `git ls-files`.split($\)

  s.license = "MIT"

  s.add_dependency "bunny", "~> 2.7"
end

class StreamingTestController < ApplicationController
  def index
    response.headers['Content-Type'] = 'text/event-stream'
    5.times {
      response.stream.write "hello world\n"
      puts "wrote a line"
      sleep 1
    }
  ensure
    response.stream.close
  end
end

class StreamingTestController < ApplicationController
  include ActionController::Live

  def index
    response.headers["X-Accel-Buffering"] = "no"
    response.headers['Content-Type'] = 'text/event-stream'
    # These seem to be needed here, or the etag middleware
    # will add the 'etag' header and replace the body of the response, which will
    # kill the response. This is due to the way the etag middleware calculates
    # the digest value for the header.
    #response.headers['Last-Modified'] = '0'
    response.headers['Last-Modified'] = Time.now.httpdate
    response.headers['ETag'] = '0'
    5.times do
      response.stream.write "hello world\n"
      puts "wrote a line"
      sleep 1
    end
  ensure
    response.stream.close
  end
end

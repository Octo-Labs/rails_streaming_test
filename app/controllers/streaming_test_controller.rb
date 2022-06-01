class StreamingTestController < ApplicationController
  include ActionController::Live

  def index
    # This header doesn't seem to be necessary, but it's probably good to set it.
    response.headers['Content-Type'] = 'text/event-stream'

    # These two headers are requried to work around a mismatch of expectations between
    # rack 2.2.x and rails. https://github.com/rack/rack/issues/1619
    response.headers['Last-Modified'] = Time.now.httpdate
    response.headers['ETag'] = '0'

    5.times do
      response.stream.write "hello world\n"
      sleep 1
    end
  ensure
    response.stream.close
  end
end

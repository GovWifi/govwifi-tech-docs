# README: https://ugur.ozyilmazel.com/blog/en/2025/03/11/fix-middleman-live-reload/
# Fix for livereload not working during development due to the following error:
# ERROR Rack::Lint::LintError: uppercase character in header name: Content-Type

module Rack
  class DowncaseHeaders
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      new_headers = headers.transform_keys(&:downcase)
      [status, new_headers, body]
    end
  end
end

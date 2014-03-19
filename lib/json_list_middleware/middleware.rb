require 'json'

module JsonListMiddleware
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => error
      if env['HTTP_ACCEPT'] =~ /application\/json/
        body = env['rack.input']

        lines = body.split("\n")

        invalid = false
        values = []
        lines.each do |line|
          begin
            values << JSON.parse(line)
          rescue => e
            invalid = true
          end

          break if invalid
        end

        unless invalid
          env['rack.input'] = values

          status, headers, response = @app.call(env)
          return [status, headers, response]
        else
          raise error
        end
      else
        raise error
      end
    end
  end
end
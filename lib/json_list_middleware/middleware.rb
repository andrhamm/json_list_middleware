require 'json'

module JsonListMiddleware
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => error
      raise error unless env['HTTP_ACCEPT'] =~ /application\/json/

      values = []
      env['rack.input'].each_line do |line|
        begin
          values << JSON.parse(line)
        rescue
          raise error
        end
      end

      new_body = values.to_json
      env['CONTENT_LENGTH'] = new_body.length
      env['rack.input'] = StringIO.new new_body

      @app.call(env)
    end
  end
end
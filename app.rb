require 'rack'
require_relative 'time_parser'

class App

  def call(env)
    @request = Rack::Request.new(env)

    return make_response(404, 'Not found, use /time') unless @request.path_info == '/time'

    return make_response(400, 'No params') unless @request.params['format']

    format = TimeParser.new(@request.params['format'])

    if format.valid?
      make_response(200, format.time_request)
    else
      make_response(400, "Unknown time format #{format.out_format}")
    end
  end

  private

  def make_response(status, body)
    [status, { 'Content-Type' => 'text/plain' }, [body]]
  end

end

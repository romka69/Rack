require 'rack'
require_relative 'time_parser'

class App

  def call(env)
    @request = Rack::Request.new(env)

    if @request.path_info == '/time'
      return [400, header, ['No params']] unless @request.params['format']

      format = TimeParser.new(@request.params)

      if format.out_format.empty?
        [200, header, [Time.now.strftime(format.in_format)]]
      else
        [400, header, ["Unknown time format #{format.out_format}"]]
      end

    else
      [404, header, ['Not found, use /time']]
    end

  end

  private

  def header
    { 'Content-Type' => 'text/plain' }
  end

end

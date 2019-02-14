class TimeParser

  FORMAT_TIME = {
      'year' => '%Y',
      'month' => '%m',
      'day' => '%d',
      'hour' => '%H',
      'minute' => '%M',
      'second' => '%S'
  }.freeze

  attr_reader :in_format, :out_format

  def initialize(params)
    parse_format = params['format'].split(',')

    in_format, @out_format = parse_format.partition { |param| FORMAT_TIME.key?(param) }

    @in_format = in_format.map { |handler| FORMAT_TIME[handler] }.join('-')
  end

end

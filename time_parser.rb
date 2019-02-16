class TimeParser

  FORMAT_TIME = {
      'year' => '%Y',
      'month' => '%m',
      'day' => '%d',
      'hour' => '%H',
      'minute' => '%M',
      'second' => '%S'
  }.freeze

  attr_reader :unknown

  def initialize(formats)
    formats = formats.split(',')
    @known, @unknown = formats.partition { |format| FORMAT_TIME.key?(format) }
    join_valid_formats
  end

  def join_valid_formats
    @known_format = @known.map { |handler| FORMAT_TIME[handler] }.join('-')
  end

  def valid?
    @unknown.empty?
  end

  def time_request
    Time.now.strftime(@known_format)
  end

end

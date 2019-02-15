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

  def initialize(formats)
    formats = formats.split(',')
    partition_formats(formats)
    join_valid_formats
  end

  def partition_formats(formats)
    @in_format, @out_format = formats.partition { |format| FORMAT_TIME.key?(format) }
  end

  def join_valid_formats
    @in_format = @in_format.map { |handler| FORMAT_TIME[handler] }.join('-')
  end

  def valid?
    @out_format.empty?
  end

  def time_request
    Time.now.strftime(@in_format)
  end

end

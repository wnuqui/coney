require 'simplecov'
SimpleCov.start

require 'cm'
require 'vcr'

RSpec.configure do |config|
  config.before do
    ARGV.replace []
  end

  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end

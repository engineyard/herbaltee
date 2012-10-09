require 'erb'
require 'logger'

module Herbaltee
  DATE_FORMAT = '%Y%m%d%H%M%S'
  LOG_LOCATION = STDOUT

  def self.logger
    @logger ||= Logger.new(LOG_LOCATION)
  end

  def self.now
    DateTime.now.strftime(DATE_FORMAT)
  end
end

require 'herbaltee/template'

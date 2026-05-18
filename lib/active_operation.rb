require "active_support/dependencies/autoload"
require "active_support/callbacks"
require "delegate"
require "smart_properties"

module ActiveOperation
  class Error < RuntimeError; end
  class AlreadyCompletedError < Error; end

  # Internal control-flow signals raised by #halt / #succeed from inside an
  # operation's #execute. Inheriting from Exception (not StandardError) so
  # user code's bare `rescue` does not silently swallow them.
  class Halted < Exception; end
  class Succeeded < Exception; end
end

require_relative "active_operation/version"
require_relative "active_operation/input"
require_relative "active_operation/base"
require_relative "active_operation/pipeline"

require_relative "active_operation/matcher" if defined?(::RSpec)

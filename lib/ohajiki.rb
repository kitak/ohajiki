require "ohajiki/version"
require File.expand_path('../ohajiki/config', __FILE__)
require File.expand_path('../ohajiki/repo', __FILE__)

module Ohajiki
  class ConfigNotFound < StandardError; end
end

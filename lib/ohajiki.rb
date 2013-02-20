require "ohajiki/version"
require File.expand_path('../config', __FILE__)
require File.expand_path('../repo', __FILE__)

module Ohajiki
  class ConfigNotFound < StandardError; end
end

# coding: utf-8

module Ohajiki
  module Config
    def self.load(path)
      conf = File.read(path)
      proc { 
        conf = "$SAFE = 2;"+conf
        self.module_eval conf 
      }.call
    end

    def self.const_missing(id)
      # Default settings
      case id
      when :LOG_PATH 
        '/tmp/ohajiki.log'
      when :REMOTE_REPO_URL 
        raise ConfigNotFound, "require REMOTE_REPO_URL in config file"  
      when :SYNC_DIR_PATH 
        raise ConfigNotFound, "require SYNC_DIR_PATH in config file"  
      when :SYNC_INTERVAL_SEC
        10 
      end
    end
  end
end

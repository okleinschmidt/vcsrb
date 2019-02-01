require 'yaml'

module Vcsrb
  class Config

    def self.load
      dotfile = File.join(ENV['HOME'], '.vcsrb.yml')
      if File.exist?(dotfile)
        config = YAML.load_file(dotfile)
      else
        abort "Config not found #{dotfile}"
      end
      config
    end

  end
end

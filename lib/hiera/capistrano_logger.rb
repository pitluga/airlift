class Hiera
  module Capistrano_logger
    def self.warn(msg)
      Capistrano::Configuration.instance.logger.important(msg) if Capistrano::Configuration.instance
    end

    def self.debug(msg)
      Capistrano::Configuration.instance.logger.debug(msg) if Capistrano::Configuration.instance
    end
  end
end

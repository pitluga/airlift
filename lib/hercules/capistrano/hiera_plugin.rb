module Hercules
  module Capistrano
    module HieraPlugin
      def lookup(key)
        hiera = Hiera.new(
          :config => {
            :yaml => { :datadir => hiera_data_dir },
            :backends => ["yaml"],
            :logger => "capistrano",
            :hierarchy => ["%{domain}/%{hostname}", "%{domain}", "common"]
          }
        )
        hiera.lookup(key, nil, self)
      end

      class CapistranoLogger
        def initialize(capistrano)
          @capistrano = capistrano
        end

      end
    end
  end
end

module Hercules
  module Capistrano
    module HieraPlugin
      def lookup(key)
        hiera = Hiera.new(
          :config => {
            :yaml => { :datadir => hiera_data_dir },
            :backends => ["yaml"],
            :hierarchy => ["%{domain}/%{hostname}", "%{domain}", "common"]
          }
        )
        hiera.lookup(key, nil, self)
      end
    end
  end
end

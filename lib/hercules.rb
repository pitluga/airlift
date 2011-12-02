require 'capistrano'
require 'hiera'

module Hercules
end

require 'hercules/applications'
require 'hercules/data_center'
require 'hercules/hiera_plugin'

Capistrano.plugin :data_center, Hercules::DataCenter
Capistrano.plugin :hiera, Hercules::HieraPlugin

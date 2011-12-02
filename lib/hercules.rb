require 'capistrano'
require 'hiera'

module Hercules
end

require 'hercules/capistrano/applications'
require 'hercules/capistrano/data_center'
require 'hercules/capistrano/hiera_plugin'

Capistrano.plugin :data_center, Hercules::Capistrano::DataCenter
Capistrano.plugin :hiera, Hercules::Capistrano::HieraPlugin

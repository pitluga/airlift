require 'capistrano'
require 'hiera'

module Airlift
end

require 'airlift/capistrano/applications'
require 'airlift/capistrano/data_center_plugin'
require 'airlift/capistrano/hiera_plugin'

Capistrano.plugin :data_center, Airlift::Capistrano::DataCenterPlugin
Capistrano.plugin :hiera, Airlift::Capistrano::HieraPlugin

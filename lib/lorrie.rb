require 'capistrano'
require 'hiera'

module Lorrie
end

require 'lorrie/applications'
require 'lorrie/data_center'
require 'lorrie/hiera_plugin'

Capistrano.plugin :data_center, Lorrie::DataCenter
Capistrano.plugin :hiera, Lorrie::HieraPlugin

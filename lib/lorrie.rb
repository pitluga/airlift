require 'capistrano'

require 'lorrie/applications'
require 'lorrie/data_center'
Capistrano.plugin :data_center, Lorrie::DataCenter


module Lorrie
end

require 'thor'

module Hercules
  class CLI < Thor
    include Thor::Actions

    desc "new", "creates a new project at given PATH"
    def new(path)
      empty_directory(File.join(path, 'applications'))
      create_file(File.join(path, 'applications', 'supply_drop.rb'), <<-EOF)
require 'supply_drop'

role :server, *data_center.nodes
      EOF
      empty_directory(File.join(path, 'data_centers'))
      empty_directory(File.join(path, 'extdata'))
      empty_directory(File.join(path, 'manifests'))
      empty_directory(File.join(path, 'modules'))
      create_file(File.join(path, 'Capfile'), <<-EOF)
require 'rubygems'
require 'lorrie'
Dir.glob(File.expand_path('../data_centers/*.rb', __FILE__)).each { |dc| load(dc) }
      EOF
    end
  end
end
require 'thor'

module Lorrie
  class CLI < Thor
    include Thor::Actions

    desc "new", "creates a new project at given PATH"
    def new(path)
      empty_directory(File.join(path, 'applications'))
      create_file(File.join(path, 'applications', 'puppet.rb'), <<-EOF)
require 'supply_drop'
      EOF
      empty_directory(File.join(path, 'data_centers'))
      empty_directory(File.join(path, 'extdata'))
      empty_directory(File.join(path, 'manifests'))
      empty_directory(File.join(path, 'modules'))
      create_file(File.join(path, 'Capfile'), <<-EOF)
require 'rubygems'
require 'lorrie/data_center'
Dir.glob(File.expand_path('../data_centers/*.rb', __FILE__)).each { |dc| load(dc) }
      EOF
    end
  end
end

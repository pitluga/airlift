require 'thor'
require 'thor/group'
require 'airlift/generate'

module Airlift
  class CLI < Thor
    include Thor::Actions
    source_root File.expand_path("../templates", __FILE__)

    register(Generate, 'generate', 'generate ARTIFACT', 'generators for data_centers, applications, puppet modules, etc.')

    desc "new", "creates a new project at given PATH"
    def new(path)
      empty_directory File.join(path, 'applications')
      copy_file(
        File.join("applications", "supply_drop.rb"),
        File.join(path, 'applications', 'supply_drop.rb')
      )
      empty_directory File.join(path, 'data_centers')
      directory "data", File.join(path, "data")
      directory "manifests", File.join(path, "manifests")
      empty_directory File.join(path, 'modules')
      directory "plugins", File.join(path, "plugins")
      copy_file "Capfile", File.join(path, 'Capfile')
      copy_file "puppet.conf", File.join(path, 'puppet.conf')
      copy_file "site.pp", File.join(path, "site.pp")
    end
  end
end

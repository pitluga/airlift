module Airlift
  class Generate < Thor
    include Thor::Actions
    source_root File.expand_path("../templates", __FILE__)

    desc "generate data_center NAME DOMAIN", "creates a new data center definition, ex herc generate data_center development example.com"
    def data_center(name, domain)
      template(
        File.join("data_centers", "data_center.rb.erb"),
        File.join("data_centers", "#{name}.rb"),
        :name => name,
        :domain => domain
      )
      empty_directory File.join("data", domain)
      create_file File.join("data", "#{domain}.yaml")
    end
  end
end

require 'spec_helper'

describe Hercules::HieraPlugin do
  describe "lookup" do
    it "looks up keys in domain specific yaml files" do
      config = Capistrano::Configuration.new
      config.set(:hiera_data_dir, File.expand_path("../support/data", __FILE__))
      config.set(:domain, "example.com")

      config.hiera.lookup("key").should == "environment-specific value"
    end

    it "defaults to finding keys in teh common yaml" do
      config = Capistrano::Configuration.new
      config.set(:hiera_data_dir, File.expand_path("../support/data", __FILE__))

      config.hiera.lookup("key").should == "common value"
    end

    it "looks up nested values" do
      pending "need to pull request hiera"
      config = Capistrano::Configuration.new
      config.set(:hiera_data_dir, File.expand_path("../support/data", __FILE__))

      config.hiera.lookup("deeply::nested::key").should == "deeply nested value"
    end
  end
end

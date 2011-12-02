require 'spec_helper'

describe Hercules::Capistrano::DataCenter do
  describe "define" do
    it "creates a task for the data center" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box', :app
      end
      config.amazon.tasks.should include(:default)
    end

    it "creates a subtask for each node" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box', :app
      end
      config.amazon.tasks.keys.should include(:box)
    end

    it "stores variables specific to the data center" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        set :variable, "value"
      end
      config.variables[:variable].should be_nil
      config.amazon.default
      config.variable.should == "value"
    end

    it "stores variables that use blocks" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        set(:variable) { "value" }
      end
      config.variables[:variable].should be_nil
      config.amazon.default
      config.variable.should == "value"
    end

    it "exposes data center specific variables to nodes" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        set(:variable) { "value" }
        node 'box', :app
      end
      config.variables[:variable].should be_nil
      config.amazon.box
      config.variable.should == "value"
    end
  end

  describe "nodes" do
    it "lists all nodes if no tags are provided" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box1', :app
        node 'box2', :app
        node 'box3', :db
      end
      config.amazon.default
      config.data_center.nodes.sort.should == %w(box1 box2 box3)
    end

    it "returns all nodes currently tagged" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box1', :app
        node 'box2', :app
        node 'box3', :db
      end
      config.amazon.default
      config.data_center.nodes(:app).sort.should == %w(box1 box2)
    end

    it "only returns a given node when its task is run" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box1', :app
        node 'box2', :app
      end
      config.amazon.box1
      config.data_center.nodes(:app).sort.should == %w(box1)
    end

    it "lists nodes with multiple tags" do
      config = Capistrano::Configuration.new
      config.data_center.define :amazon do
        node 'box1', :app
        node 'box2', :app
        node 'box3', :db
      end
      config.amazon.default
      config.data_center.nodes(:app, :db).sort.should == %w(box1 box2 box3)
    end
  end
end

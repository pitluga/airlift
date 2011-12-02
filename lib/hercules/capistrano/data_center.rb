module Hercules
  module Capistrano
    module DataCenter
      def define(name, &definition)
        context = Context.new
        context.instance_eval &definition
        namespace name do
          task :_variables do
            context.variables.each_pair do |variable, (args, block)|
              set(variable, *args, &block)
            end
          end

          task :default do
            send(:_variables)
            context.nodes.each_pair do |node_name, tags|
              data_center._activate_node(node_name, tags)
            end
          end

          context.nodes.each_pair do |node_name, tags|
            task node_name do
              send(:_variables)
              data_center._activate_node(node_name, tags)
            end
          end
        end
      end

      def _activate_node(node, tags)
        active_nodes = fetch(:__data_center_active_nodes, {})
        set(:__data_center_active_nodes, active_nodes.merge(node => tags))
      end

      def nodes(*tags)
        if tags.empty?
          fetch(:__data_center_active_nodes, {}).keys
        else
          fetch(:__data_center_active_nodes, {}).select do |name, node_tags|
            (tags & node_tags).any?
          end.map(&:first)
        end
      end

      private
      class Context
        attr_reader :nodes
        attr_reader :variables

        def initialize
          @nodes = {}
          @variables = {}
        end

        def node(name, *tags)
          @nodes[name] = tags
        end

        def set(name, *args, &block)
          @variables[name] = [args, block]
        end
      end
    end
  end
end

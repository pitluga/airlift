require 'supply_drop'

role :server, *data_center.nodes

set :puppet_destination, "~/supply_drop"
plugins = [
  "$RUBYLIB",
  "$HOME/supply_drop/plugins/hiera-puppet-0.2.0/lib",
  "$HOME/supply_drop/plugins/hiera-0.2.0/lib"
]

set :puppet_command, "env RUBYLIB=#{plugins.join(":")} puppet"
set :puppet_parameters, "--debug --config #{puppet_destination}/puppet.conf site.pp"

require 'puppet/face'
require 'puppet/util/terminal'
require 'puppet/network/http_pool'
require 'uri'

Puppet::Face.define(:node, '0.0.1') do
  action :count do
    summary "Returns number of nodes from PuppetDB"
    arguments "<none>"

    description <<-'EOT'
        This is a simple wrapper to retrieve the node count from PuppetDB
    EOT
    notes <<-'EOT'
        Directly connects to PuppetDB with your local certificate
    EOT
    examples <<-'EOT'
        List node count:

        $ puppet node count
    EOT

    when_invoked do |options|

      # Logic to support PuppetDB API versions 3 and 4
      # and the associated PuppetDB terminus interfaces
      if Puppet::Util::Puppetdb.config.respond_to?("server_urls")
        uri = URI(Puppet::Util::Puppetdb.config.server_urls.first)
        server = uri.host
        port = uri.port
        endpoint = "/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes"
      else
        server = Puppet::Util::Puppetdb.server
        port = Puppet::Util::Puppetdb.port
        endpoint = "/metrics/v1/mbeans/puppetlabs.puppetdb.query.population:type=default,name=num-nodes"
      end

      connection = Puppet::Network::HttpPool.http_instance(server, port)
      unless result = PSON.load(connection.request_get("#{endpoint}", {"Accept" => 'application/json'}).body)
        raise "Error parsing json output of puppet search #{filtered}"
      end
      puts "Node count: #{result['Value']}"
    end
  end
end

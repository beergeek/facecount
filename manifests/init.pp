# Include this class in your Puppet Master/Master Of Masters to create
# a CSV logfile of your node counts to /var/log/puppetlabs/node_count.txt
class facecount(
  Integer $frequency = 30,
) {
  $logfile  = '/var/log/puppetlabs/node_count.txt'
  $date     = 'date -u  --iso-8601=minutes'
  $command  = "echo \$(${date}), \$(/opt/puppetlabs/puppet/bin/puppet node count) >> ${logfile}"

  cron { 'puppet_node_counts':
    ensure  => present,
    command => $command,
    user    => 'root',
    minute  => "*/${frequency}",
  }
}

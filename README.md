# facecount

## Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with facecount](#setup)
3. [Usage - Using the new action](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Overview

A Puppet Face to retrieve the node count from PuppetDB.

## Setup

Install the module via Code Manager or r10k and then run Puppet.
If you would like to gather historical node count statistics to a file, include the provided class `facecount` on your Puppet Enterprise Master either through Puppet Code or the [Node Classifier](https://docs.puppet.com/pe/latest/console_classes_groups.html) and statistics will be collected into the file `/var/log/puppetlabs/node_count.txt` for you and updated every 30 minutes.

## Usage

Once installed and puppet has run, you will have a new action for the `puppet node` subcommand on the Puppet master:

```shell
puppet node count
```

## Limitations

Requires the module to be installed on your Puppet Master and run puppet at least once on the Puppet master before the command becomes available.  Can normally be only run from the Puppet master due to PuppetDB library access.

## Development

Happy for PRs!

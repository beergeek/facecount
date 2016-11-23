# facecount

## Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with facecount](#setup)
3. [Usage - Using the new action](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Overview

A Puppet Module providing the ability for customer to easily track their Puppet Enterprise node counts.

### Features

* Puppet Face to retrieve the node count from PuppetDB
* Custom fact to expose the same information in the console
* Puppet Class to gather historical node counts to a log file

## Setup

Install the module via Code Manager or r10k and then run Puppet.

## Usage

Once installed and puppet has run, you will have a new action for the `puppet node` subcommand on the Puppet master:

```shell
puppet node count
```

## Limitations

Requires the module to be installed on your Puppet Master and run puppet at least once on the Puppet master before the command becomes available.  Can normally be only run from the Puppet master due to PuppetDB library access.

## Development

Happy for PRs!

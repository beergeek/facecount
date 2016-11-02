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

## Usage

Once installed and puppet has run, you will have a new action for the `puppet node` subcommand:

```shell
puppet node count
```

## Limitations

Requires the module to be installed on your Puppet Master and run on each agent node at least once before the command becomes available

## Development

Happy for PRs!

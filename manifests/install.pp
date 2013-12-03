# == Class: newrelic::install
#
# install the newrelic package, meant to be used only as part of the 'newrelic' class
#
# === Parameters
#
# [*$newrelic::params::package*]
#   the name of the package
#
# === Authors
#
# Jeremy Kitchen <jeremy@nationbuilder.com>
#
# === Copyright
#
# Copyright 2013 3dna
#
class newrelic::install {
  # probably should be a separate class
  apt::source { 'newrelic':
    location    => 'http://apt.newrelic.com/debian/',
    release     => 'newrelic',
    repos       => 'non-free',
    key         => '548C16BF',
    key_source  => 'http://apt.atl.3dna.io/548C16BF.asc',
  }

  package {$newrelic::params::package:
    ensure  => installed,
    require => Apt::Source['newrelic'],
  }
}

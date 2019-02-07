# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include oracle::install
class oracle::install inherits oracle {
    # install packages
  $oracle::packages.each | $name | {
    package { $name:
      ensure   => present,
      provider => 'yum',
    }
  }
}

# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include oracle
class oracle(
  Array $packages,
  String $memlock,
  Boolean $hugepage,
) {
  # class containment
  contain ::oracle::install
  contain ::oracle::config
  # class relationships
  Class['::oracle::install']
  -> Class['::oracle::config']
}

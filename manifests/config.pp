# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include oracle::config
class oracle::config {
  #set huge pages configuration
  if $oracle::hugepage {
    $memorysize_kb = (0.9*$::memory['system']['total_bytes'])/1024
    $key = split("${memorysize_kb} ", Regexp['[.\s]'])
    $use_memlock = $key ? {
      undef => '3145728',
      default => $key[0],
    }
  } else {
    $use_memlock = $oracle::memlock
  }
  # limits parameters for memlock
  limits::limits { 'oracle/memlock':
    both => $use_memlock,
  }
}

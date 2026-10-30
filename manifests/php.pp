# @summary
#   Install a version of PHP supported by Zabbix on system where the default one is too old
# @param manage_php
#   If set, version of PHP to install on systems where default one is not supported by Zabbix (actually only EL8).
#
class zabbix::php (
  Optional[String] $manage_php = undef
) {
  if $manage_php {
    case $facts['os']['family'] {
      'RedHat': {
        case $facts['os']['release']['major'] {
          '8': {
            package { 'php':
              ensure   => $manage_php,
              provider => 'dnfmodule',
            }
          }
          default: {
          }
        }
      }
      default: {
      }
    }
  }
}

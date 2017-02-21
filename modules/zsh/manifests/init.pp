class zsh (
  String $user = 'shibumi',
  Array $plugins = [
    'zsh',
    'grml-zsh-config',
  ]

) {

  package { $plugins: ensure => 'present' }

  file { "/home/${user}/.zshrc":
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => "puppet:///modules/${module_name}/files/zshrc",
  }

  file { "/home/${user}/.zshrc.local":
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => "puppet:///modules/${module_name}/files/zshrc.local",
  }

  file { "/home/${user}/.zshrc.pre":
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => "puppet:///modules/${module_name}/files/zshrc.pre",
  }
}

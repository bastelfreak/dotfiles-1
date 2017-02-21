class zsh (
  $user
) {
  $plugins = [ 
    'zsh',
    'grml-zsh-config',
  ]

  package { $plugins: ensure => 'present' }

  file { "/home/${user}/.zshrc":
    owner  => "${user}",
    group  => "${user}",
    mode   => "0644",
    source => "puppet:///modules/zsh/files/zshrc",
  }

  file { "/home/${user}/.zshrc.local":
    owner  => "${user}",
    group  => "${user}",
    mode   => "0644",
    source => "puppet:///modules/zsh/files/zshrc.local",
  }

  file { "/home/${user}/.zshrc.pre":
    owner  => "${user}",
    group  => "${user}",
    mode   => "0644",
    source => "puppet:///modules/zsh/files/zshrc.pre",
  }
}

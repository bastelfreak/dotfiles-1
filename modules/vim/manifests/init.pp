class vim ($user) {
  $plugins = [ 
    'vim', 
    'vim-airline', 
    'vim-align', 
    'vim-fugitive',
    'vim-nerdcommenter', 
    'vim-surround', 
    'vim-syntastic', 
    'vim-systemd', 
    'vim-ultisnips' 
  ]

  package { $plugins: ensure => 'present' }

  file { "/home/${user}/.vimrc":
    owner  => "${user}",
    group  => "${user}",
    mode   => "0644",
    source => "puppet:///modules/vim/files/vimrc",
  }

}

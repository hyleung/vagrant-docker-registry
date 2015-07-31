node default {
  class { 'apt':
    update => {
      tries   => 3,
      timeout => undef
    }
  }
  class { 'docker':
      tcp_bind      => 'tcp://127.0.0.1:4243',
      socket_bind   => 'unix:///var/run/docker.sock'
  }
  docker::image { 'registry':
    image_tag   => '2.0.1',
    require     => Class['docker']
  } ~>
  docker::run { 'registry':
    image   => 'registry',
    ports   => ['5000:5000'],
    volumes => ['/var/registry-data'],
    env     => ['STORAGE_PATH=/var/registry-data'],
  }
}

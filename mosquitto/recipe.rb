class Mosquitto < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'mosquitto'
  version  '1.1.3'
  revision 1
  homepage 'http://mosquitto.org'
  source   "http://mosquitto.org/files/source/mosquitto-#{version}.tar.gz"
  sha1     '38faf05f696b6a8183c6f5e06fdba78ffb632316'
  
  section   'database'
  conflicts 'mosquitto'
  replaces  'mosquitto'
  
  config_files '/etc/mosquitto/mosquitto.conf'
  post_install 'postinst'

  def build
    make
  end

  def install
    var('log/mosquitto').mkpath

    etc('default').install_p workdir('mosquitto.default'), 'mosquitto'
    etc('init').install_p builddir('mosquitto.upstart'), 'mosquitto.conf'

    make :install, 'DESTDIR' => destdir
  end
end
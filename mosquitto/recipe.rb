class Mosquitto < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'mosquitto'
  version  '1.1.3'
  homepage 'http://mosquitto.org'
  source   "http://mosquitto.org/files/source/mosquitto-#{version}.tar.gz"
  sha1     '38faf05f696b6a8183c6f5e06fdba78ffb632316'

  conflicts 'mosquitto'
  replaces  'mosquitto'

  def build
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
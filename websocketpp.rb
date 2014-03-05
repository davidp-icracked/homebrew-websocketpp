require 'formula'

class Websocktpp < Formula
  homepage 'https://github.com/zaphoyd/websocketpp'
  url 'https://github.com/zaphoyd/websocketpp/archive/0.3.0-alpha4.tar.gz'
  # sha1 ''

  depends_on 'scons' => :build

  def install
    # this is how the SConstruct build system creates file paths
    gccversion = `g++ -dumpversion`
    gccversion = gccversion.delete("\n");
    # run the build
    system "scons platform=linux-gcc"
    #install the libs
    #lib.install "libs/linux-gcc-#{gccversion}/libwebsocketpp_linux-gcc-#{gccversion}_libmt.a" => "libwebsocketpp.a", 
    #{}"libs/linux-gcc-#{gccversion}/libwebsocketpp_linux-gcc-#{gccversion}_libmt.dylib" => "websocketpp.dylib"
    # install the headers
    include.install "include/websocketpp" => "websocketpp"
  end

  test do
    system "false"
  end
end

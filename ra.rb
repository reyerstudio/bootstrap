class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.28"
  url "https://github.com/reyerstudio/devstrap/archive/88f25c108ebe71ba1888af9aaff42f3731cb96ea.zip"
  sha256 "eeca708a69d17b60b3dc8cde901f53c8a9ddcad2dc142014504536f20133d986"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

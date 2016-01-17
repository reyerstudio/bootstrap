class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.13"
  url "https://github.com/reyerstudio/devstrap/archive/97d06bf03140b36d49da6597ebbf503be8402f44.zip"
  sha256 "da27d057de71146c755d379003641a1a52b2b83e6700514449aec4d6ee3e90ca"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

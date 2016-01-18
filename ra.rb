class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.14"
  url "https://github.com/reyerstudio/devstrap/archive/b091c035f158d6694a6d73fd7bd821740a806deb.zip"
  sha256 "542795b1b7649808f4e9898a9f8de705885e4b11188998f5685011c849b98365"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

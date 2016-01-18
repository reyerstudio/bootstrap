class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.16"
  url "https://github.com/reyerstudio/devstrap/archive/f13f4a0ce9ce118df2c3ba07444ad2097bdc8727.zip"
  sha256 "448ea1732d8d8be8ac899db7bb71709be85dc650a0da7304d53e575cb1b12fb2"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

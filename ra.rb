class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.3"
  url "https://github.com/reyerstudio/devstrap/archive/de1ef822c7ef529fda2e683723e176aa0de3f2b8.zip"
  sha256 "de7ca67a8cd1dea0d55f983461839095a8ae263c172c67cfa445064d1385602a"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/libexec"]
  end
end

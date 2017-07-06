class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.30"
  url "https://github.com/reyerstudio/devstrap/archive/4f96f7f68cb4971b75f5de844a25cc5eae08d164.zip"
  sha256 "ea9ed6b012040044ae62dc00c723b859cd905e9fc057b7c5dc4b3aaddc9dbf5e"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

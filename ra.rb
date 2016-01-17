class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.11"
  url "https://github.com/reyerstudio/devstrap/archive/5fd7f8aeb21176319afaaa99e30dba4634cc1076.zip"
  sha256 "eaf5608ee175b870d03779be78eed9f6806b7e534226a992b7ac0db989ff7acc"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

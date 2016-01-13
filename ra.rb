class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.5"
  url "https://github.com/reyerstudio/devstrap/archive/f88195557fc762a64366660ac11456df9a1293c8.zip"
  sha256 "28bd6d51f0ac1aba7e9a70d123409604e654e4cc3ead0d4642e4452ac4b4929b"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

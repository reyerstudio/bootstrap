class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.6"
  url "https://github.com/reyerstudio/devstrap/archive/6ccbf3dd3a91147e434e5e0a6337634be4b51375.zip"
  sha256 "0d5a369b2aaa5ded968f8ac5d6658d42e26a27a683344eb9f13f7fe58f41a97b"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

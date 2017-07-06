class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.31"
  url "https://github.com/reyerstudio/devstrap/archive/2c9d49995d0585f015b9fda79b92aea54e43a3be.zip"
  sha256 "2bd22acb4db689eeeb011b82e4ac611aa69c0eeecd69383c6ca666263061bf03"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.15"
  url "https://github.com/reyerstudio/devstrap/archive/2a8ca9402572f79d2e4d370bcaa821e8bb9a2474.zip"
  sha256 "bd75096a17b09948a7b86b709faab569b2635c74c1a180022225644e9780f7ce"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

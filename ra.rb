class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.5"
  url "https://github.com/reyerstudio/devstrap/archive/82250fb2a2b81d4d9da3aedd23c154d0a5888491.zip"
  sha256 "9d98cba30bf56ec4416e502b8294af4d155885ab8a6ea2075cbf621ba720fe6d"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

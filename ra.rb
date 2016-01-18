class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.18"
  url "https://github.com/reyerstudio/devstrap/archive/0a4148a8a9f0bfe43f61f98d517d744ba273d722.zip"
  sha256 "a72d6d958c1cfae2ccac0bcf9a1828f502aca04b282c776f087fac481635bba2"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

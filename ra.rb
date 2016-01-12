class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.20"
  url "https://github.com/reyerstudio/devstrap/archive/f0eb985893574e90e44ea08b9e160baa57af38ce.zip"
  sha256 "c9a26a9da276c6a4d60197bfe3d354a55c49a7b4e97d9277b5728fe9d11f73c9"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

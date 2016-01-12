class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.19"
  url "https://github.com/reyerstudio/devstrap/archive/b765cee559ff2e735c5fc344be1fc63b127c8da3.zip"
  sha256 "fd04da3ab70b5d14ac6e6d71d6c4979b1ecf60c507d5f782b1c49b088d0b81d8"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

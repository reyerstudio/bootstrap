class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.5"
  url "https://github.com/reyerstudio/devstrap/archive/a10efc614906fc85a42ea123fa5c01321b892068.zip"
  sha256 "95859a8e0127f929e2e9197eca0d34544ef92f38678501ba7693e98017aea742"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

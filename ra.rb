class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.1"
  url "https://github.com/reyerstudio/devstrap/archive/ad5e0497b977d3f113fd563e3192baa8494818d7.zip"
  sha256 "27c0f4703210936b736e277fce4383174c58f1ecea5a0ca5cdcb0e87c0454aaa"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

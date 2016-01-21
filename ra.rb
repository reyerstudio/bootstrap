class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.26"
  url "https://github.com/reyerstudio/devstrap/archive/8fad875b8016427bb39bac437945a7f1d3f53203.zip"
  sha256 "eef5e41d2f82885bbfd345c39c9d29f92e2db5c79b8a830e41fee7442544d22a"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

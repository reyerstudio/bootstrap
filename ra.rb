class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.19"
  url "https://github.com/reyerstudio/devstrap/archive/7fd97fab487e30cbcc0705a1debdddc293c98cbc.zip"
  sha256 "5a798c473071fc60982af34adcdbb665bac79c4aa37b0407bac5f2554db3ea8d"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

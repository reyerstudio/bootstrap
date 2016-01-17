class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.8"
  url "https://github.com/reyerstudio/devstrap/archive/47c70787207664b361c2b7393049590ee3bb2f14.zip"
  sha256 "b2b02ccfb134c1ea3507db3b736baf94e2a4117eb25ec0d695887b20c3c07167"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

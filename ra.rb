class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.23"
  url "https://github.com/reyerstudio/devstrap/archive/64478231ce2ec9e44075c67cbbe5ca29a317dbec.zip"
  sha256 "bea79f84f1bdf3d5600b5f535c5e0df799c74d5397d2556ddd198cfc0407551c"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

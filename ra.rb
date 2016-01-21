class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.25"
  url "https://github.com/reyerstudio/devstrap/archive/2a43d8682734bb180645d39fecf07532073d8943.zip"
  sha256 "4f34b322267d98b5057b77937510e08b6e732deedcf635e89851ecd9152f0972"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

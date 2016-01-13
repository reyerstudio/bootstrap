class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.0"
  url "https://github.com/reyerstudio/devstrap/archive/65a6ecb0b0073d83f8026a557b290743e7b96596.zip"
  sha256 "9c0344f6536e54b4845f407a6e24d954f7579e9160cb56801be44ce8d1d30183"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

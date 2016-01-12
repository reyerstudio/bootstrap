class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.17"
  url "https://github.com/reyerstudio/devstrap/archive/ae922e6f9b6db90a49da3b494c88008ab35cf766.zip"
  sha256 "2a466cfe5304125f237b87f8e0542530f53a59b63a7de0277882df92716a00fe"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

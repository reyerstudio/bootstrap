class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.21"
  url "https://github.com/reyerstudio/devstrap/archive/ceec9589d3d5241956235ab3ce7363e8b8bbff81.zip"
  sha256 "39e0bf7e6f8854c8e57ac66bc07d09513d263330b28e91f4ced4c550fbd9ff15"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

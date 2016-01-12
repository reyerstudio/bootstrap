class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.23"
  url "https://github.com/reyerstudio/devstrap/archive/e84e7bbe46d5bcbede1004f4570e3d47232a784f.zip"
  sha256 "e891d5a7d7fd2501f50847cdf2c15959da7e525dfc25c098c3c151ff236305e0"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

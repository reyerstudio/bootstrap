class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.24"
  url "https://github.com/reyerstudio/devstrap/archive/42f152d81a2a2f49bd312c2c2eddb11b56cddc7c.zip"
  sha256 "914a055720c76b7692bca0cba370aa73b2d36bbf2f4f6d31c257687557409146"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

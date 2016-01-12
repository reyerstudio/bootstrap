class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.21"
  url "https://github.com/reyerstudio/devstrap/archive/e8a6c1094ac1abc7fa4c08c44b27c38185cc128d.zip"
  sha256 "04f19180088e005a3da7b152574309a48eccacb78c7f044afdcf104ac9ced16c"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

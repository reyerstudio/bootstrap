class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.15"
  url "https://github.com/reyerstudio/devstrap/archive/773e7a65bf63ac34534fa0be0698571bd9a2b33a.zip"
  sha256 "37f3be77fd5a0f4d50c1257f17e6bb41c814e98728ba8af8ef7c527ea7f859eb"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.22"
  url "https://github.com/reyerstudio/devstrap/archive/30418942ce9fe4c22fe812d2b10a69f4730ad9f7.zip"
  sha256 "a52692cbc6de89dec40384f9e96ea7c01acf07f2fb4a3aa28c511ee661da1145"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

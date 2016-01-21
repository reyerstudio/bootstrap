class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.24"
  url "https://github.com/reyerstudio/devstrap/archive/242434c6d6fd380de64d90aaa27b5ce1d0a7795e.zip"
  sha256 "49de1fcbc8987810606124f583198d59a2f684056c6cc26eca6297b915306fd2"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

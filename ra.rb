class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.18"
  url "https://github.com/reyerstudio/devstrap/archive/fcbdc20b699ad042df81b874ed18a08e755b8939.zip"
  sha256 "d0f73c0874d54ee86f309315c9fe79b4098d98acd6f5d093067b7c35aeb23262"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

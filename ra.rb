class Devstrap < Formula
  desc "Bootstrapping development environment"
  version "0.2.12"
  url "https://github.com/reyerstudio/devstrap/archive/6531a174eb667d16a0f29047126355a9bf60de1c.zip"
  sha256 "272e9bc2b5ec459b9afea29fc8115cbac0628e42a5de28148d73fec0190413da"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end

  def post_install
    system "dos2unix #{bin}/*"
    system "dos2unix #{lib}/*"
    system "dos2unix #{libexec}/*"
  end
end

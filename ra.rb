class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.13"
  url "https://github.com/reyerstudio/devstrap/archive/1887b47a84825410ed2d86ffb6de6fa6da1acb7a.zip"
  sha256 "5adb5afd020e2f2144910119d1832375f5b3fe6197a9cc54990fce1ef48e21b4"

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

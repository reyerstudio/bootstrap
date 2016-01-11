class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.14"
  url "https://github.com/reyerstudio/devstrap/archive/4ea95bbcaaf2292364fea35bb00ab43f09a9d1a6.zip"
  sha256 "e882be7f1445ccc4483209725e3d0cddcf8c769a5ddefec411ce1204fe089df0"

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

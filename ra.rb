class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.16"
  url "https://github.com/reyerstudio/devstrap/archive/1ca4364acac7536ef2ec3b970f772c2b4d006075.zip"
  sha256 "0ede54f0f873433a280899d85840ca979b946f315ba6266c6a64b9a51bb1f95e"

  bottle :unneeded

  def install
    bin.install     "ra/unix/bin/ra"
    lib.install     Dir["ra/unix/lib/*"]
    libexec.install Dir["ra/unix/libexec/*"]
  end
end

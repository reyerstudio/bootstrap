class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.12"
  url "https://github.com/reyerstudio/devstrap/archive/d89aa2d9f334519d1c75e50c8042ebc04cf8b5fa.zip"
  sha256 "3fa38653948a7f79dd8c7b171e103af04b40db82106f947bbf4e0bb8a40d2634"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

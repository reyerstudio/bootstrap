class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.2"
  url "https://github.com/reyerstudio/devstrap/archive/383b375d3732821470da7079e5840473a44a6934.zip"
  sha256 "05a8ab10be2261c0d5f3a1570021ab5669e52deb0d98100428009a6e5da46332"

  bottle :unneeded

  def install
    bin.install "ra/unix/bin/ra"
    system      "install.sh", "#{prefix}"
  end
end

class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.27"
  url "https://github.com/reyerstudio/devstrap/archive/a86c9104391c0099738e69f1bbcec4377dc97c3c.zip"
  sha256 "56ece5e3ff9e46d7eb0fa738ee9992e46cc223df161d5765b642e05fe4d351b1"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

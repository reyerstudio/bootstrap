class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.9"
  url "https://github.com/reyerstudio/devstrap/archive/c0d2d1a14a64b7d191816584637f412c16091ce6.zip"
  sha256 "32a4e80a107ec9800a2fd0ac8a90edc439566af48adab480511920974f93443b"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.4"
  url "https://github.com/reyerstudio/devstrap/archive/57dd1d987b4fc84c1e30ace8c746cb3f4dfda3c4.zip"
  sha256 "3ac27da0ae7ddaf83117478ac013b7606c957f8d585518391052d4c76faf03f6"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

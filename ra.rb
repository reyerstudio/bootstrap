class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.7"
  url "https://github.com/reyerstudio/devstrap/archive/03b46992f5346631f031f304b5a61e812bf23b0f.zip"
  sha256 "88d4193311d7a0da79dced451197d00b271564ea0be32bfcbaf33e49e55fccb3"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end

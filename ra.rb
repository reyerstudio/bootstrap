class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.17"
  url "https://github.com/reyerstudio/devstrap/archive/5bc1ef9ed15d05c40988515f80ee288c5b7b9ac7.zip"
  sha256 "6bff7a25620313ff25ce63922c418675290d7332aa0ab6a1e75333743fbf5a1a"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

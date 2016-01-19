class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.22"
  url "https://github.com/reyerstudio/devstrap/archive/43ee59fd9f6b10727bf4b53ecd2858ccbec0fb76.zip"
  sha256 "4252f7524941ffe7f8219e2bae1d07a3b42c8a2bd360bb248c3e8886422f99eb"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

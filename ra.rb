class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.17"
  url "https://github.com/reyerstudio/devstrap/archive/fc7d756ae7f89d739a3226797327bfe4c052b745.zip"
  sha256 "131988f71f9b4a48dcf4755bd4fbb065d6030cd8e05d0508a4914222f7914c1f"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

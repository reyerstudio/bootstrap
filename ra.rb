class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.2"
  url "https://github.com/reyerstudio/devstrap/archive/c092fa0fe31fdc2180cdafa63fabb81a6b558260.zip"
  sha256 "cced2334f44b11f499f27a564e7bb2fa6d36ed4e2c9cbc9d07b19d93acf5eb5f"

  bottle :unneeded

  def install
    bin.install "ra/unix/bin/ra"
    system      "./install.sh", "#{prefix}"
  end
end

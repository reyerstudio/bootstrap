class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.2"
  url "https://github.com/reyerstudio/devstrap/archive/ee39f56e1d89affbb9e113625c962d17ec3ded0e.zip"
  sha256 "dc4620b0a59a13623eca0f327186b4c3908a1380290a15846f5ddd85c23d3545"

  bottle :unneeded

  def install
    bin.install "ra/unix/bin/ra"
    system      "./install.sh", "#{prefix}"
  end
end

class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.2.25"
  url "https://github.com/reyerstudio/devstrap/archive/1f79b827dbe57af163d93f5af8b6a18cb56e1614.zip"
  sha256 "a0fe290c9eb510d3ac2231f53208dfcc8f595dc7e9e6a011a8e2585801d2e26e"

  bottle :unneeded

  def install
    bin.install "ra/unix/bin/ra"
  end
end

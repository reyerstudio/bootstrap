class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.20"
  url "https://github.com/reyerstudio/devstrap/archive/4d01bb973e9b669d288c196b3b108981dcdb4f52.zip"
  sha256 "33844db5198d429bb915f21f82e4410f011dd5bfdfb4ea3d792fba2df2131700"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

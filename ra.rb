class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.32"
  url "https://github.com/reyerstudio/devstrap/archive/ed799a14a06cdbfce04b6468bc6af1f49aaf1c0f.zip"
  sha256 "bef249fb92afa3afadabe2caa650b2805a4683961f995cd7799bbb6328b3dcd0"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

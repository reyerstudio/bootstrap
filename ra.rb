class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.10"
  url "https://github.com/reyerstudio/devstrap/archive/70697f121c363d09c00bd1d209cf7a8c70d861d8.zip"
  sha256 "7d54c76ee730ba716ba3563c066d80109b782ac4a18e870d2403b13610324bd5"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

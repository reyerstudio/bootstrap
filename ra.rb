class Ra < Formula
  desc "Bootstrapping development environment"
  version "0.3.29"
  url "https://github.com/reyerstudio/devstrap/archive/8bd7b8cb376ce97fd466a871de90ae798292b49b.zip"
  sha256 "c959d644d0fb72d3eefda47737fcb95dcb8f66b555ab8bbd86a412cfdc0a4387"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
    prefix.install Dir["ra/unix/console"]
  end
end

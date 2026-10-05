class LithosMetal < Formula
  desc "lithos-metal: local LLM inference on Apple silicon"
  homepage "https://github.com/lithos-ai/lithos-metal"
  url "https://github.com/lithos-ai/lithos-metal/releases/download/v0.1.2/lithos-metal-0.1.2-macos-arm64.tar.gz"
  version "0.1.2"
  sha256 "a51b821923b21ed4134979779f0ed77c98cbc9b227fed7627ec620704169a3e3"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", libexec
    wheel = Dir[buildpath/"wheels/lithos_metal-*.whl"].first
    system libexec/"bin/python", "-m", "pip", "install", "--no-index",
           "--find-links=#{buildpath}/wheels", "#{wheel}[serve]"
    bin.install_symlink libexec/"bin/lithos-metal"
  end

  test do
    assert_match "lithos-metal", shell_output("#{bin}/lithos-metal --version")
    assert_match "DSpark", shell_output("#{bin}/lithos-metal models")
    system libexec/"bin/python", "-c",
           "from monolith.runtime import is_available; assert is_available()"
  end
end

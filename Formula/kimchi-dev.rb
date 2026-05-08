# typed: false
# frozen_string_literal: true

class KimchiDev < Formula
  desc "A coding agent CLI powered by Cast AI"
  homepage "https://github.com/castai/kimchi-dev"
  version "0.0.31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_arm64.tar.gz"
    sha256 "b5a96201e89c61be7cec7f6f676535475874187b6223e0a76d0f5d0eec137fe2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_amd64.tar.gz"
    sha256 "fa818f3ff53f3e3c715262fa08c07be8fb0ae7d2a5bcaaa06b6df260050ae944"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_arm64.tar.gz"
    sha256 "b5f078495cbc4e0f855267fe245ba62ec4511e3dcea61251c7a838de517dfe0e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_amd64.tar.gz"
    sha256 "b720977c699ae306cfb6d119f75dcb5edd41ff45a5f532780487f2d4267a0cc6"
  end

  def install
    bin.install "bin/kimchi"
    (share/"kimchi").install Dir["share/kimchi/*"]
  end

  test do
    system "#{bin}/kimchi", "--version"
  end
end

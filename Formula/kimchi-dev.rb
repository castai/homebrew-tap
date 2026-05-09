# typed: false
# frozen_string_literal: true

class KimchiDev < Formula
  desc "A coding agent CLI powered by Cast AI"
  homepage "https://github.com/castai/kimchi-dev"
  version "0.1.0.rc.2-ferment"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_arm64.tar.gz"
    sha256 "0535c4362593696074dbe103b869aec71e64b25700dd2b3b4e21f00f793808a1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_amd64.tar.gz"
    sha256 "e8a2c798f5d438bb414b2dffef03a3502b7e35fe0140fc7ec2893a16f4bd9e4a"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_arm64.tar.gz"
    sha256 "a8f0c4d3ac13c3ec796257e2bebf934957275072d85b6911b8c41b178dc4d40a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_amd64.tar.gz"
    sha256 "0154a751552b9cafdc977e342af80acf213137a5fc0395b0905dc7ab2f88e6fd"
  end

  def install
    bin.install "bin/kimchi"
    (share/"kimchi").install Dir["share/kimchi/*"]
  end

  test do
    system "#{bin}/kimchi", "--version"
  end
end

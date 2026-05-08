# typed: false
# frozen_string_literal: true

class KimchiDev < Formula
  desc "A coding agent CLI powered by Cast AI"
  homepage "https://github.com/castai/kimchi-dev"
  version "0.1.0.rc.1-ferment"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_arm64.tar.gz"
    sha256 "d228ff07b264afeae5950663b1cb38a0cfc06e0fae577c1bc11564ad2b848a42"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_amd64.tar.gz"
    sha256 "4e27e861ef80232f1fc099bf13b69e522b888650c7de3f25ed8b91abe865b5e7"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_arm64.tar.gz"
    sha256 "ea1245af208e3be36ea16282db3eda4a96548d2c175b5808eed7c2fbcbe51401"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_amd64.tar.gz"
    sha256 "5ec5262d8b747cd0b800a8f8dff3af39faaa285af0d9da64f02b65cc0115158a"
  end

  def install
    bin.install "bin/kimchi"
    (share/"kimchi").install Dir["share/kimchi/*"]
  end

  test do
    system "#{bin}/kimchi", "--version"
  end
end

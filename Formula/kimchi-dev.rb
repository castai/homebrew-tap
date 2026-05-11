# typed: false
# frozen_string_literal: true

class KimchiDev < Formula
  desc "A coding agent CLI powered by Cast AI"
  homepage "https://github.com/castai/kimchi-dev"
  version "0.0.37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_arm64.tar.gz"
    sha256 "01210c88e2dba041e5071f3ed30b28f1094dd0c30326787f7868f4365410c389"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_amd64.tar.gz"
    sha256 "6ab66a3364227ac58ff49a4cabcd550420ce04ca51aa73881ba06af82f4c0637"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_arm64.tar.gz"
    sha256 "17c423ae8da0c06a198d56c290ce863182ed09bbf26249c09306159eed889a3f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_amd64.tar.gz"
    sha256 "e402e3fbec74761b8a4b0dd1bf6c978e45fc1d70ef16c4c37fccf35b233f529a"
  end

  def install
    bin.install "bin/kimchi"
    (share/"kimchi").install Dir["share/kimchi/*"]
  end

  test do
    system "#{bin}/kimchi", "--version"
  end
end

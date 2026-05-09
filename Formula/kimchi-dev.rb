# typed: false
# frozen_string_literal: true

class KimchiDev < Formula
  desc "A coding agent CLI powered by Cast AI"
  homepage "https://github.com/castai/kimchi-dev"
  version "0.1.0.rc.5-ferment"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_arm64.tar.gz"
    sha256 "f9197fe89dcda9eaf598b9f5551a1d32408ad71f76212ec65e1ac1e3783b564b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_darwin_amd64.tar.gz"
    sha256 "a44fcd4c2ed2cbb7be49400ee30148291bc51879ca795d3cc51fee2e9075a5b0"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_arm64.tar.gz"
    sha256 "d81a6e8d02c6ff3ab52901becb4fb018102c3cd81b475cb6f8ceb2c8d9aacd03"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/kimchi-dev/releases/download/v#{version}/kimchi_linux_amd64.tar.gz"
    sha256 "5a5835182a457617a2fbb9666869d8655fa67da565c7a7352f3749fd2ba13608"
  end

  def install
    bin.install "bin/kimchi"
    (share/"kimchi").install Dir["share/kimchi/*"]
  end

  test do
    system "#{bin}/kimchi", "--version"
  end
end

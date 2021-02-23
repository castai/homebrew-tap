# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CastCli < Formula
  desc "Multiple clouds in one K8s cluster. Best combination of everything in cloud"
  homepage "https://cast.ai"
  version "0.1.0"
  license "Apache License"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/castai/cast-cli/releases/download/v0.1.0/cast-cli_0.1.0_darwin_amd64.zip"
    sha256 "cb0e0731a83a3f28d328d1d2dab23181207bbdb149c6f7c3b8791e84930c603e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/castai/cast-cli/releases/download/v0.1.0/cast-cli_0.1.0_linux_amd64.zip"
    sha256 "04e7c8bbcb1ae17c9b47fe7a78ec8178e85d4203f032f497857be00d1eed31c1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/castai/cast-cli/releases/download/v0.1.0/cast-cli_0.1.0_linux_arm64.zip"
    sha256 "d22784a5ba7a2ae4b694b9e41fa8cfabc5c7c9f6cca84f81daf0c7a77761f5b2"
  end

  def install
    bin.install "cast"
    bash_completion.install "completions/cast.bash" => "cast"
    zsh_completion.install "completions/cast.zsh" => "_cast"
    fish_completion.install "completions/cast.fish"
  end

  test do
    system "#{bin}/cast version"
  end
end

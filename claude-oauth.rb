# typed: false
# frozen_string_literal: true

# Written by the claude-oauth release workflow. DO NOT EDIT.
class ClaudeOauth < Formula
  desc "Manage Claude Code OAuth tokens across accounts and run Claude with any of them"
  homepage "https://github.com/nguyenvanduocit/claude-oauth"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nguyenvanduocit/claude-oauth/releases/download/v0.1.0/claude-oauth-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "de85ad5eeac8265fe4ec23c32ec5fbb08bd7b64922dc7e808a3deb8040750ea7"
    else
      url "https://github.com/nguyenvanduocit/claude-oauth/releases/download/v0.1.0/claude-oauth-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d46dd046e26df1fb60346a12301913a0a51ab5d6319183297ab95604e9c9077e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nguyenvanduocit/claude-oauth/releases/download/v0.1.0/claude-oauth-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c82a7f204f721e349d858ddf789255c7c7c5ae07ed5e0a192427da20517f2a2d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nguyenvanduocit/claude-oauth/releases/download/v0.1.0/claude-oauth-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d27f97630feb208aa6eb71040db69dbd2af2cad4b4b60bcaa87d2c7d6ea5f4b"
    end
  end

  def install
    bin.install "claude-oauth"
  end

  def caveats
    <<~EOS
      claude-oauth runs Claude Code, which is installed separately:
        https://docs.claude.com/en/docs/claude-code
    EOS
  end

  test do
    assert_match "claude-oauth #{version}", shell_output("#{bin}/claude-oauth --version")
  end
end

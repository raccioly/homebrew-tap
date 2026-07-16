# typed: false
# frozen_string_literal: true

# DocGuard Homebrew formula (Node CLI, installed from the npm registry tarball).
# Cookbook followed: https://docs.brew.sh/Node-for-Formula-Authors
#
# How to publish (this file stages the formula; Homebrew taps live in their own repo):
#   1. Create the tap repo: github.com/raccioly/homebrew-tap
#   2. Copy this file to Formula/docguard.rb in that repo.
#   3. Users install with:
#        brew tap raccioly/tap
#        brew install raccioly/tap/docguard
#   4. On each release, bump `url` + `sha256`:
#        curl -sL https://registry.npmjs.org/docguard-cli/-/docguard-cli-<VER>.tgz | shasum -a 256
#
# sha256 below is the real hash of the published docguard-cli-0.33.1.tgz
# (verified against npm's dist.integrity sha512 for the same bytes).
class Docguard < Formula
  desc "Deterministic documentation-drift guard for Canonical-Driven Development"
  homepage "https://github.com/raccioly/docguard"
  url "https://registry.npmjs.org/docguard-cli/-/docguard-cli-0.33.1.tgz"
  sha256 "c49c34a85c7b810a51369a91fec57846c366ad69728a524617dcd755382cd910"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # `docguard --version` prints "docguard v0.29.0"
    assert_match version.to_s, shell_output("#{bin}/docguard --version")
  end
end

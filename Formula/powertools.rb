class Powertools < Formula
  desc "Code indexing and navigation tools for AI agents"
  homepage "https://github.com/zachswift615/agent-power-tools"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-arm64.tar.gz"
      sha256 "7417e52918bbc70cdea5cfcece6efbe5a6fdf57c096bbb2e4d7ea8dcac3379ca"
    else
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-x86_64.tar.gz"
      sha256 "c2ff6b9c13e3501b7019f43a32a27515dbfbe9ca19ab5976d19ecb9937627d3e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-linux-x86_64.tar.gz"
      sha256 "4fac431cf6a1313ea9b494ae872d98834d01fecdf28012c65494761e62186f6c"
    end
  end

  def install
    bin.install "powertools"
  end

  def caveats
    <<~EOS
      Powertools has been installed!

      To use as an MCP server with Claude Code, create a .mcp.json file at your project root:

      {
        "mcpServers": {
          "powertools": {
            "command": "#{bin}/powertools",
            "args": ["--mcp-server"]
          }
        }
      }

      Then restart Claude Code. The .mcp.json file can be committed to git for team collaboration.

      For more information, see: https://github.com/zachswift615/agent-power-tools
    EOS
  end

  test do
    assert_match "powertools", shell_output("#{bin}/powertools --help")
  end
end

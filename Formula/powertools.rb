class Powertools < Formula
  desc "Code indexing and navigation tools for AI agents"
  homepage "https://github.com/zachswift615/agent-power-tools"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-arm64.tar.gz"
      sha256 "10ebfda0579adb50eb992796c38baee7e50a154235be8e4b684a357f1784b8d1"
    else
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-x86_64.tar.gz"
      sha256 "8cf36f041f14b2523615fd25cc86a0b486bc3d7d4eb10fb9bfe236af44f96876"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-linux-x86_64.tar.gz"
      sha256 "f566eeabd5e261129f8b173f217b4ca06fbed618db758e7205adad1b3fc38c18"
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

class Powertools < Formula
  desc "Code indexing and navigation tools for AI agents"
  homepage "https://github.com/zachswift615/agent-power-tools"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-arm64.tar.gz"
      sha256 "86ffa8d0b96fd42451831e9bc4df2609124e0b3b244aa84b0bd2ad693223b8c3"
    else
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-x86_64.tar.gz"
      sha256 "79065074e81ee373cd3e141a95eccba84f0c608db7aa1c9263cbdc411862ab7e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-linux-x86_64.tar.gz"
      sha256 "c8008d4192d96928265149ce6720535ae3ce099b1691e2c49308d81c247b214e"
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

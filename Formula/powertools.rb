class Powertools < Formula
  desc "Code indexing and navigation tools for AI agents"
  homepage "https://github.com/zachswift615/agent-power-tools"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-arm64.tar.gz"
      sha256 "a4e51e9855a48be0f2ff9336624eacc86ed552fb188935870cfe41bcddb5a3dd"
    else
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-x86_64.tar.gz"
      sha256 "0f0261402c33838af8557e69f04aac3940fa7fecc55944ae45e8504997c0d554"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-linux-x86_64.tar.gz"
      sha256 "87a7fa58c9815c7e791e3704cf123fb78431d903b3359a7834deea17ede643ac"
    end
  end

  def install
    bin.install "powertools"
  end

  def caveats
    <<~EOS
      Powertools has been installed!

      To use as an MCP server with Claude Code, add this to ~/.config/claude/mcp_settings.json:

      {
        "mcpServers": {
          "powertools": {
            "command": "#{bin}/powertools",
            "args": ["--mcp-server"],
            "description": "Semantic code navigation and analysis tools"
          }
        }
      }

      For more information, see: https://github.com/zachswift615/agent-power-tools
    EOS
  end

  test do
    assert_match "powertools", shell_output("#{bin}/powertools --help")
  end
end

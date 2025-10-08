class Powertools < Formula
  desc "Code indexing and navigation tools for AI agents"
  homepage "https://github.com/zachswift615/agent-power-tools"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-arm64.tar.gz"
      sha256 "4ae91e92665ad9504c97021032d83d954a1359302c14eb118211de6b7cd5aad2"
    else
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-macos-x86_64.tar.gz"
      sha256 "4bb75333926a402feff2e9a9f0647d53c7cac02bfe4cad4a8b02a606a79e942b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zachswift615/agent-power-tools/releases/download/v#{version}/powertools-linux-x86_64.tar.gz"
      sha256 "2512c8aed68032bfa94ff8f3909ab4f74bbfcf0f34e2981c296ae7c97fec0ede"
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

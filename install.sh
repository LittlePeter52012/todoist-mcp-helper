#!/bin/bash
# ─── Todoist MCP Server 一键安装脚本 ───
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "📦 Todoist MCP Server Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 1. Create virtual environment
if [ ! -d "venv" ]; then
    echo "🔧 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# 2. Install the package
echo "📥 Installing todoist-mcp..."
venv/bin/pip install --upgrade pip -q
venv/bin/pip install -e . -q

# 3. Verify
echo ""
echo "✅ Installation complete!"
echo ""

# 4. Print the absolute path to the executable
EXEC_PATH="$SCRIPT_DIR/venv/bin/todoist-mcp"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📍 Executable path:"
echo "   $EXEC_PATH"
echo ""

# 5. Reminder about API token
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔑 重要：使用前需设置 API Token 环境变量"
echo "   获取地址：https://app.todoist.com/app/settings/integrations"
echo ""

# 6. Print config templates
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📋 Copy-paste configs below:"
echo ""

echo "── Claude Code (run in terminal) ──"
cat <<EOF
claude mcp add-json todoist '{
  "type": "stdio",
  "command": "$EXEC_PATH",
  "env": {
    "TODOIST_API_TOKEN": "YOUR_TOKEN_HERE"
  }
}' --scope user
EOF

echo ""
echo "── Claude Desktop (add to ~/Library/Application Support/Claude/claude_desktop_config.json) ──"
cat <<EOF
{
  "mcpServers": {
    "todoist": {
      "command": "$EXEC_PATH",
      "env": {
        "TODOIST_API_TOKEN": "YOUR_TOKEN_HERE"
      }
    }
  }
}
EOF

echo ""
echo "── Cursor (add to .cursor/mcp.json) ──"
cat <<EOF
{
  "mcpServers": {
    "todoist": {
      "command": "$EXEC_PATH",
      "env": {
        "TODOIST_API_TOKEN": "YOUR_TOKEN_HERE"
      }
    }
  }
}
EOF

echo ""
echo "── Gemini CLI / Antigravity (add to ~/.gemini/settings.json) ──"
cat <<EOF
{
  "mcpServers": {
    "todoist": {
      "command": "$EXEC_PATH",
      "env": {
        "TODOIST_API_TOKEN": "YOUR_TOKEN_HERE"
      }
    }
  }
}
EOF

echo ""
echo "🎉 Done! Replace YOUR_TOKEN_HERE with your actual Todoist API token."

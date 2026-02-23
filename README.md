<p align="center">
  <img src="icon.png" width="120" alt="Todoist MCP Helper Icon">
</p>

# Todoist MCP Helper ✅

**English** | [中文](README_CN.md)

[![PyPI](https://img.shields.io/pypi/v/todoist-mcp-helper)](https://pypi.org/project/todoist-mcp-helper/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Sponsor](https://img.shields.io/badge/💖_Sponsor-946CE6?style=flat)](https://afdian.com/a/LittlePeter52012)

**Connect AI agents to your [Todoist](https://todoist.com) tasks** via the Model Context Protocol (MCP).

Create, search, complete, and manage your Todoist tasks — all from Claude, Gemini, Cursor, or any MCP-compatible AI agent.

---

## ✨ Features

| Category       | Tools                                                                                                 | Description                                        |
| -------------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| 📋 Tasks        | `list_tasks`, `get_task`, `create_task`, `update_task`, `complete_task`, `delete_task`, `reopen_task` | Full task CRUD with priority, due dates, labels    |
| 🔍 Smart Search | `search_task_by_name`, `complete_task_by_name`, `delete_task_by_name`, `update_task_by_name`          | Find and operate on tasks by name (fuzzy matching) |
| 📁 Projects     | `list_projects`, `create_project`, `update_project`, `delete_project`                                 | Manage projects                                    |
| 📑 Sections     | `list_sections`, `create_section`, `delete_section`                                                   | Organize tasks into sections                       |
| 🏷️ Labels       | `list_labels`, `create_label`                                                                         | Tag management                                     |
| 💬 Comments     | `get_comments`, `create_comment`                                                                      | Task & project comments                            |
| ⚙️ Config       | `set_api_token`, `get_current_config`                                                                 | Runtime token management                           |

**24 tools total** — the most comprehensive Todoist MCP server available.

---

## 🚀 Quick Start

### Option A: Quick Run with `uvx` (Recommended)

No installation needed — runs in a temporary isolated environment:

```bash
uvx todoist-mcp-helper
```

> Don't have `uv`? Install it: `curl -LsSf https://astral.sh/uv/install.sh | sh`

### Option B: Install with `pip`

```bash
pip install todoist-mcp-helper
```

### Get Your API Token

1. Go to [Todoist Settings → Integrations](https://app.todoist.com/app/settings/integrations)
2. Scroll to **Developer** → copy your **API Token**

---

## 📋 Configuration

All credentials are passed via **environment variables** — no tokens in code.

| Variable            | Description            | Required |
| ------------------- | ---------------------- | -------- |
| `TODOIST_API_TOKEN` | Your Todoist API Token | ✅        |

---

## 🔧 Platform Configuration

### Claude Desktop

Add to `claude_desktop_config.json`:

<table><tr><th>uvx (recommended)</th><th>pip</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "todoist-mcp-helper",
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td></tr></table>

### Gemini CLI

Add to `~/.gemini/settings.json`:

<table><tr><th>uvx (recommended)</th><th>pip</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "todoist-mcp-helper",
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td></tr></table>

### Cursor

Add to `.cursor/mcp.json`:

<table><tr><th>uvx (recommended)</th><th>pip</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "todoist-mcp-helper",
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

</td></tr></table>

### CherryStudio / Other MCP Clients

```json
{
  "todoist": {
    "command": "uvx",
    "args": ["todoist-mcp-helper"],
    "env": {
      "TODOIST_API_TOKEN": "your_token"
    }
  }
}
```

### ModelScope (魔塔)

Select **Stdio** mode in the MCP service configuration, then use:

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "your_token"
      }
    }
  }
}
```

Add `TODOIST_API_TOKEN` in the environment variables section with your API token value.

---

## 💡 Usage Examples

Once configured, ask your AI agent:

- *"Show me my tasks for today"*
- *"Create a task: Buy groceries, due tomorrow, priority 2"*
- *"Complete the task about groceries"*
- *"Search for tasks related to meeting"*
- *"List all my projects"*
- *"Add a comment to my latest task"*

---

## 🔐 Runtime Configuration

Change tokens without restarting:

- **`set_api_token`** — Switch Todoist account at runtime
- **`get_current_config`** — Check current configuration

---

## 💖 Support

If this project helps you, consider buying me a coffee!
Your support keeps this project alive and growing ✨

<table>
<tr>
<td align="center" width="50%">

### ☕ 爱发电 (Afdian)

<a href="https://afdian.com/a/LittlePeter52012">
  <img src="https://img.shields.io/badge/爱发电-946CE6?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0id2hpdGUiPjxwYXRoIGQ9Ik0xMiAyMS4zNWwtMS40NS0xLjMyQzUuNCAxNS4zNiAyIDEyLjI4IDIgOC41IDIgNS40MiA0LjQyIDMgNy41IDNjMS43NCAwIDMuNDEuODEgNC41IDIuMDlDMTMuMDkgMy44MSAxNC43NiAzIDE2LjUgMyAxOS41OCAzIDIyIDUuNDIgMjIgOC41YzAgMy43OC0zLjQgNi44Ni04LjU1IDExLjU0TDEyIDIxLjM1eiIvPjwvc3ZnPg==&logoColor=white" alt="Support on Afdian">
</a>

<sub>Supports Alipay & WeChat Pay</sub>

</td>
<td align="center" width="50%">

### 💎 Crypto (USDC / ERC-20)

<a href="https://littlepeter52012.github.io/todoist-mcp-helper/donate.html">
  <img src="https://img.shields.io/badge/USDC%2FETH-Donate_Now-6c5ce7?style=for-the-badge&logo=ethereum&logoColor=white" alt="Donate Crypto">
</a>

<sub>Click to donate — supports MetaMask, SafePal & more</sub>

</td>
</tr>
</table>

> Every little bit helps — **thank you!** 🙏

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

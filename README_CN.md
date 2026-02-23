<p align="center">
  <img src="icon.png" width="120" alt="Todoist MCP Helper Icon">
</p>

# Todoist MCP Helper ✅

[English](README.md) | **中文**

[![PyPI](https://img.shields.io/pypi/v/todoist-mcp-helper)](https://pypi.org/project/todoist-mcp-helper/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Sponsor](https://img.shields.io/badge/💖_赞助-946CE6?style=flat)](https://afdian.com/a/LittlePeter52012)

**通过 MCP 协议将 AI 智能体连接到你的 [Todoist](https://todoist.com) 任务管理系统。**

从 Claude、Gemini、Cursor 或任何 MCP 兼容的 AI 智能体中创建、搜索、完成和管理你的 Todoist 任务。

---

## ✨ 功能一览

| 类别       | 工具                                                                                                  | 说明                                           |
| ---------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| 📋 任务     | `list_tasks`, `get_task`, `create_task`, `update_task`, `complete_task`, `delete_task`, `reopen_task` | 完整的任务增删改查，支持优先级、截止日期、标签 |
| 🔍 智能搜索 | `search_task_by_name`, `complete_task_by_name`, `delete_task_by_name`, `update_task_by_name`          | 按名称模糊匹配查找并操作任务                   |
| 📁 项目     | `list_projects`, `create_project`, `update_project`, `delete_project`                                 | 项目管理                                       |
| 📑 分区     | `list_sections`, `create_section`, `delete_section`                                                   | 将任务组织到分区中                             |
| 🏷️ 标签     | `list_labels`, `create_label`                                                                         | 标签管理                                       |
| 💬 评论     | `get_comments`, `create_comment`                                                                      | 任务和项目评论                                 |
| ⚙️ 配置     | `set_api_token`, `get_current_config`                                                                 | 运行时 Token 管理                              |

**共 24 个工具** — 功能最全面的 Todoist MCP 服务器。

---

## 🚀 快速开始

### 方式一：`uvx` 直接运行（推荐）

无需安装，在临时隔离环境中直接运行：

```bash
uvx todoist-mcp-helper
```

> 没有 `uv`？一键安装：`curl -LsSf https://astral.sh/uv/install.sh | sh`

### 方式二：`pip` 安装

```bash
pip install todoist-mcp-helper
```

### 获取 API Token

1. 打开 [Todoist 设置 → 集成](https://app.todoist.com/app/settings/integrations)
2. 滚动到 **开发者** → 复制你的 **API Token**

---

## 📋 配置

所有凭证通过**环境变量**传入 — 代码中无需写入任何 Token。

| 变量                | 说明                   | 必填 |
| ------------------- | ---------------------- | ---- |
| `TODOIST_API_TOKEN` | 你的 Todoist API Token | ✅    |

---

## 🔧 各平台配置方式

### Claude Desktop

添加到 `claude_desktop_config.json`：

<table><tr><th>uvx 方式（推荐）</th><th>pip 方式</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "你的Token"
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
        "TODOIST_API_TOKEN": "你的Token"
      }
    }
  }
}
```

</td></tr></table>

### Gemini CLI

添加到 `~/.gemini/settings.json`：

<table><tr><th>uvx 方式（推荐）</th><th>pip 方式</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "你的Token"
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
        "TODOIST_API_TOKEN": "你的Token"
      }
    }
  }
}
```

</td></tr></table>

### Cursor

添加到 `.cursor/mcp.json`：

<table><tr><th>uvx 方式（推荐）</th><th>pip 方式</th></tr><tr><td>

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "你的Token"
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
        "TODOIST_API_TOKEN": "你的Token"
      }
    }
  }
}
```

</td></tr></table>

### CherryStudio / 其他 MCP 客户端

```json
{
  "todoist": {
    "command": "uvx",
    "args": ["todoist-mcp-helper"],
    "env": {
      "TODOIST_API_TOKEN": "你的Token"
    }
  }
}
```

### 魔塔 ModelScope

在 MCP 服务配置中选择 **Stdio** 模式，填入以下配置：

```json
{
  "mcpServers": {
    "todoist": {
      "command": "uvx",
      "args": ["todoist-mcp-helper"],
      "env": {
        "TODOIST_API_TOKEN": "你的Token"
      }
    }
  }
}
```

环境变量配置区域添加 `TODOIST_API_TOKEN`，值填入你的 API Token。

---

## 💡 使用示例

配置完成后，可以直接对 AI 智能体说：

- *"显示我今天的任务"*
- *"创建一个任务：买菜，明天截止，优先级 2"*
- *"完成那个关于买菜的任务"*
- *"搜索和会议相关的任务"*
- *"列出我所有的项目"*
- *"给最新的任务加个评论"*

---

## 🔐 运行时配置

无需重启即可更换配置：

- **`set_api_token`** — 在运行时切换 Todoist 账号
- **`get_current_config`** — 查看当前配置状态

---

## 💖 支持项目

如果这个项目对你有帮助，欢迎请作者喝杯咖啡！
你的支持是项目持续维护和迭代的最大动力 ✨

<table>
<tr>
<td align="center" width="50%">

### ☕ 爱发电

<a href="https://afdian.com/a/LittlePeter52012">
  <img src="https://img.shields.io/badge/爱发电-946CE6?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0id2hpdGUiPjxwYXRoIGQ9Ik0xMiAyMS4zNWwtMS40NS0xLjMyQzUuNCAxNS4zNiAyIDEyLjI4IDIgOC41IDIgNS40MiA0LjQyIDMgNy41IDNjMS43NCAwIDMuNDEuODEgNC41IDIuMDlDMTMuMDkgMy44MSAxNC43NiAzIDE2LjUgMyAxOS41OCAzIDIyIDUuNDIgMjIgOC41YzAgMy43OC0zLjQgNi44Ni04LjU1IDExLjU0TDEyIDIxLjM1eiIvPjwvc3ZnPg==&logoColor=white" alt="在爱发电上支持我">
</a>

<sub>支持支付宝 / 微信支付</sub>

</td>
<td align="center" width="50%">

### 💎 加密货币 (USDC / ERC-20)

<a href="https://littlepeter52012.github.io/todoist-mcp-helper/donate.html">
  <img src="https://img.shields.io/badge/USDC%2FETH-立即捐赠-6c5ce7?style=for-the-badge&logo=ethereum&logoColor=white" alt="加密货币捐赠">
</a>

<sub>点击捐赠 — 支持 MetaMask、SafePal 等钱包</sub>

</td>
</tr>
</table>

> 每一份支持都是莫大的鼓励 — **感谢！** 🙏

---

## 📄 许可证

MIT 许可证 — 详见 [LICENSE](LICENSE)。

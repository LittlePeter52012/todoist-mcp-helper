<p align="center">
  <img src="icon.png" width="120" alt="Todoist MCP Helper Icon">
</p>

# Todoist MCP Helper ✅

[English](README.md) | **中文**

[![PyPI](https://img.shields.io/pypi/v/todoist-mcp-helper)](https://pypi.org/project/todoist-mcp-helper/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**通过 MCP 协议将 AI 智能体连接到你的 [Todoist](https://todoist.com) 任务管理系统。**

从 Claude、Gemini、Cursor 或任何 MCP 兼容的 AI 智能体中创建、搜索、完成和管理你的 Todoist 任务。

---

## ✨ 功能一览

| 类别       | 工具                                                                                                  | 说明                                           |
| ---------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| 📋 任务     | `list_tasks`, `get_task`, `create_task`, `update_task`, `complete_task`, `delete_task`, `reopen_task` | 完整的任务增删改查，支持优先级、截止日期、标签 |
| 🔍 智能搜索 | `search_task_by_name`, `complete_task_by_name`, `delete_task_by_name`, `update_task_by_name`          | 按名称模糊匹配查找并操作任务                   |
| 📁 项目     | `list_projects`, `create_project`, `get_project`, `delete_project`                                    | 项目管理                                       |
| 📑 分区     | `list_sections`, `create_section`, `delete_section`                                                   | 将任务组织到分区中                             |
| 🏷️ 标签     | `list_labels`, `create_label`                                                                         | 标签管理                                       |
| 💬 评论     | `list_comments`, `add_comment`                                                                        | 任务评论                                       |
| ⚙️ 配置     | `set_api_token`, `get_current_config`                                                                 | 运行时 Token 管理                              |

**共 24 个工具** — 功能最全面的 Todoist MCP 服务器。

---

## 🚀 快速开始

### 安装

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

```json
{
  "mcpServers": {
    "todoist": {
      "command": "todoist-mcp",
      "env": {
        "TODOIST_API_TOKEN": "在此填入你的API Token"
      }
    }
  }
}
```

### Gemini CLI

添加到 `~/.gemini/settings.json`：

```json
{
  "mcpServers": {
    "todoist": {
      "command": "todoist-mcp",
      "env": {
        "TODOIST_API_TOKEN": "在此填入你的API Token"
      }
    }
  }
}
```

### Cursor

在 Cursor 设置 → MCP 中添加：

```json
{
  "todoist": {
    "command": "todoist-mcp",
    "env": {
      "TODOIST_API_TOKEN": "在此填入你的API Token"
    }
  }
}
```

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

## 📄 许可证

MIT 许可证 — 详见 [LICENSE](LICENSE)。

---
name: life-architect
version: 1.1.0
description: "人生重启系统：通过 10 次中文心理引导，帮助用户分析现状、识别隐藏目标、重构行动方向。"
author: chip1cr
license: MIT
repository: https://github.com/evgyur/fix-life-in-1-day
metadata:
  clawdbot:
    emoji: "🧠"
    triggers: ["/life", "/architect"]
  tags: ["心理复盘", "自我成长", "生活设计", "中文"]
---

# 人生重启系统 🧠

## 功能

系统包含 10 次结构化心理引导，每次包含 5—6 个阶段。它会读取当前阶段、展示中文内容、保存回答并自动推进。

## 命令

| 命令 | 作用 |
|---|---|
| `/life` | 开始或继续中文流程 |
| `/life status` | 查看完成进度 |
| `/life session N` | 跳转到第 N 次主题 |
| `/life reset` | 清除进度并重新开始 |

底层脚本：

```bash
bash scripts/handler.sh intro zh "$WORKSPACE"
bash scripts/handler.sh start zh "$WORKSPACE"
bash scripts/handler.sh save "用户回答" "$WORKSPACE"
bash scripts/handler.sh skip "$WORKSPACE"
bash scripts/export.sh "$WORKSPACE"
```

## 语言

- `zh`：中文，默认语言
- `en`：英文，兼容旧版本
- `ru`：俄文，兼容旧版本

中文会话文件位于 `references/sessions/zh/`。已有的英文和俄文文件保持不变。

## 数据位置

```text
$WORKSPACE/memory/life-architect/
```

- `state.json`：进度状态
- `session-NN.md`：用户回答
- `insights.md`：阶段洞察
- `final-document.md`：导出结果

## 注意事项

这是结构化自我反思工具，不是心理治疗或医学诊断。用户可以跳过任何问题；如果出现强烈情绪、创伤反应或危机风险，应立即暂停并联系现实中的专业支持。

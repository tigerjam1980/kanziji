# 人生重启系统迁移说明

## 迁移包结构

- `fresh-install/`：干净的技能项目，包含脚本、10 次中英文/俄文会话文案和必要说明；不包含用户会话进度。
- `test-results/`：本次个人测试的最终报告、洞察、逐次回答和状态快照。这些文件含有个人信息，不要复制到新安装的工作区或分享给其他人。

迁移包不包含原始 PDF/DOCX、临时文件、Git 数据或 `memory/` 目录。新终端只安装 `fresh-install/`。

## 在新终端安装

1. 解压迁移包，将 `fresh-install/` 复制到 AI Agent 支持的技能目录中，并按该 Agent 的技能安装规范注册 `SKILL.md`。不同 Agent 的技能目录和注册方式可能不同。
2. 在 Agent 中打开技能说明，要求它将 `SKILL.md` 作为入口，按其中的阶段流程运行，不要把 `test-results/` 作为当前用户的进度。
3. 确认终端提供 Bash 4+ 和 `jq`。Windows 可使用 Git Bash；其他终端可使用 Bash 兼容环境。
4. 选择一个全新的、专用于本轮对话的数据工作区。示例：

   ```bash
   WORKSPACE="$HOME/life-architect-workspace"
   bash scripts/handler.sh start zh "$WORKSPACE"
   bash scripts/handler.sh status "$WORKSPACE"
   ```

   首次状态应显示第 1 次主题、第 1 阶段。用户回答后，Agent 需先将回答传给保存流程，再总结、请用户审核并继续。
5. 正常继续时沿用同一工作区；要另开全新一轮时，优先换一个新的空工作区。`reset` 会删除指定工作区内的人生重启回答、洞察和报告，谨慎使用。
6. 完成第 10 次主题后，脚本会自动生成：

   ```text
   $WORKSPACE/memory/life-architect/final-document.md
   $WORKSPACE/memory/life-architect/insights.md
   ```

   Agent 应告知用户确切路径；如果导出失败，应明确报告失败。

## 给 AI Agent 的启动指令

```text
请读取 fresh-install/SKILL.md 作为本技能的运行规范。
使用一个新的空工作区开始，不要读取或复制 test-results 中的个人回答和状态。
先检查技能状态；如果是全新工作区，从第 1 次主题第 1 阶段开始。
每轮只问当前阶段。结合此前上下文去重；收到回答后先保存原文，
再给出区分事实、暂定解释和不确定性的阶段总结，并等待用户审核后再继续。
不要把推测说成诊断，也不要编造权威引文、研究或专家经历。
```

## 已知边界

- 主题脚本负责进度、回答保存、主题洞察摘录和最终报告导出。
- 根据上下文调整问题、避免语义重复、形成阶段性分析并等待用户审核，依赖 AI Agent 遵守 `SKILL.md`；不是脚本里的自动心理分析算法。
- `insights.md` 的自动内容以回答摘录为主；如 Agent 另行记录用户审核通过的分析，应明确区分自动摘录和 AI 总结。
- 该工具用于结构化自我反思，不是心理治疗、医学诊断或结果保证。

# 聂千龙 Qianlong Nie · 个人学术主页

基于 [luost26/academic-homepage](https://github.com/luost26/academic-homepage)（MIT）修改，支持中 / EN 切换。

## 修改内容

所有文字都在 `_data/` 里，每处写成 `{ zh: ..., en: ... }` 两份：

| 文件 | 内容 |
|---|---|
| `profile.yml` | 姓名、简介、研究方向、教育、技能、荣誉 |
| `experience.yml` | 经历页 |
| `projects.yml` | 项目页 |
| `navigation.yml`、`ui.yml`、`footer.yml` | 导航和各板块标题 |

> YAML 行内写法里，英文如果含逗号必须加引号。改完运行 `ruby tools/check_i18n.rb` 检查。

## 本地预览

```bash
bundle install
bundle exec jekyll serve --port 4001
```

浏览器打开 http://localhost:4001 。推送到 `main` 后由 GitHub Actions 自动部署。

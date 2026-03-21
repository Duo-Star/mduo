---
layout: ../../components/MarkdownPost.astro
title: "自用分享 - 为 Flutter 配置 GitHub - Vercel 自动化"
tags: ["flutter", "vercel", "github"]
pubDate: 'Feb. 8 2026'
likes: '+inf'
comments: '+inf'
---


# 自用分享 - 为 Flutter 配置 GitHub - Vercel 自动化

我喜欢使用 Flutter 制作小玩具，也有部署到网页的需求，同时我不想占用自己服务器，同时希望自动化，如果你和我一样，那你需要这个。

这会把下载 SDK 和编译等体力活交给 GitHub，Vercel 只负责最后的静态托管，每次 `git push` 后，GitHub 和 Vercel 会自动协作

进行以下操作前，我们默认你已经将项目推送至 GitHub 仓库，如果没有，请先创建仓库

---
## 第一步：在项目中创建配置文件和编写自动化脚本

创建githu工作流：`根目录/.github/workflows/deploy.yml`
使用以下代码：
```yaml
name: Deploy to Vercel
on:
  push:
    branches:
      - master  # 触发的分支名，也许你是main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      # 拉取代码
      - uses: actions/checkout@v4

      # 安装 Flutter 
      - uses: subosito/flutter-action@v2
        with:
          channel: 'stable'

      # 获取依赖 并 构建 Flutter Web
      - run: flutter pub get
      - run: flutter build web --release

      # 将构建产物部署到 Vercel
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          # 我们稍后在GitHub设置
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
          # 只部署构建后的 web 文件夹
          working-directory: ./build/web
          # 部署到生产环境
          vercel-args: '--prod'
```

---
## 第二步：连接和创建 Vercel 项目

使用 npm 安装  vercel：
```sh
npm install -g vercel
```

连接你的账户：
```sh
vercel login
```

创建 Vercel 项目，在 Flutter 项目根目录下运行：
```
vercel link
```

以我的一次运行为例：
```sh
[duo@duoarch YunShu]$ vercel link
? Set up “~/Project/Dart/你的项目文件夹名”? yes
? Which scope should contain your project? 小可爱's projects
? Link to existing project? no
? What’s your project’s name? 你的项目名
? In which directory is your code located? ./
> No framework detected. Default Project Settings:

- Build Command: `npm run vercel-build` or `npm run build`
- Development Command: None
- Install Command: `yarn install`, `pnpm install`, `npm install`, or `bun install`
- Output Directory: `public` if it exists, or `.`
? Want to modify these settings? no
? Do you want to change additional project settings? no
✅  Linked to 你的项目组名/你的项目名 (created .vercel)
```

运行成功后，你的 Vercel 面板上会出现你的这个项目

---
## 第三步：获取 Vercel 的密钥 (Secrets)

我们刚刚已经运行 `vercel link`，连接成功后，项目根目录会生成一个 `.vercel/project.json` 文件

你会看到类似这样的内容：
```json
{
    "projectId": "prj_xxxxxxxxxxxx",
    "orgId": "team_xxxxxxxxxxxx",
    "projectName":"xxxxx"
}
```


为了让 GitHub 有权限把文件传给 Vercel，我们需要去 GitHub 项目的：
```sh
Settings > Secrets and variables > Actions > Repository secrets
```
添加：

| ID           | V                                                                 |
| ------------ | ----------------------------------------------------------------- |
| VERCEL_TOKEN | 使用你的VERCEL_TOKEN<br>或在 [这里](https://vercel.com/account/tokens) 创建 |
| ORG_ID       | 来自：`.vercel/project.json`                                         |
| PROJECT_ID   | 来自：`.vercel/project.json`                                         |

---
## 第四步：Vercel 连接 GitHub

这一步是很简单的，只需要在 Vercel 上连接 GitHub 并同意默认的基本权限

---
## 第五步：推送，触发工作流

如题，推送一次，我们的GitHub Action就开始工作了

在推送之前，请检查`.vercel` 文件夹被排除，里面包含你的项目私有标识。理论上讲，一旦你拿到了这两个 ID 并填到了 GitHub，你就可以把本地的 `.vercel` 文件夹删掉了。

可以到项目仓库的 Action 页面查看，Flutter 项目从第一次下载到构建大约需要2-3分钟

---

## 后续工作

在 Vercel 面板的域名项里连接你自己的域名

首先，向 Vercel 致敬，他不仅提供构建服务（其实我们刚刚也不是用它构建的），还提供二级域名，对小白非常友好

填入例如 `miyu.mduo.cloud` ，然后在你的域名提供商（我是阿里云）里记录规则，指向Vercel提供的 `ns2.vercel-dns.com`， `ns1.vercel-dns.com`， `xxxxxxxx.vercel-dns-017.com` 等即可

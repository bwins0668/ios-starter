# iOS Starter

> Windows 写代码 → GitHub Actions 自动编译 iOS App  
> 赫米（Hermes）帮你搭的底座，改 `ContentView.swift` 就开始你的 App。

## 怎么用

1. **在 Windows 上写代码**——所有 `.swift` 文件都是纯文本，用 VS Code 就能编辑
2. **`git push`**——推到 GitHub 自动触发编译
3. **去 Actions 页面**——下载编译好的 `.app` 包

## 项目结构

```
StarterApp/
├── AppMain.swift          ← App 入口
├── ContentView.swift      ← 主界面（从这里开始改）
├── Assets.xcassets/       ← 图标 / 颜色 / 图片
└── Info.plist             ← App 配置
project.yml                ← Xcode 工程描述（xcodegen）
```

## 编译流程

GitHub Actions (`ios-build.yml`) 做的事：

1. 拉取 `macos-latest` 运行器
2. 安装 `xcodegen` → 生成 `.xcodeproj`
3. `xcodebuild` 编译 → 输出 `.app` 包
4. 上传为 Actions Artifact（90 天有效）

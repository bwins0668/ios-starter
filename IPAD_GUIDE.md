# iPad Swift Playgrounds — 5 分钟在真机上看到你的 App

> 不需要 Mac、不需要证书、不需要签名。所有操作在 iPad 上完成。

## 操作步骤

### 1. 打开 Swift Playgrounds

- 如果没装：App Store 搜 "Swift Playgrounds"（苹果官方，免费）

### 2. 创建 App 项目

- 打开 Playgrounds → 点左上角 **"查看所有"**（或底部 "+"）
- 选择 **"App"** 模板
- 给 App 起个名（如 `Starter`）→ 点 **"创建"**

### 3. 替换代码

Playgrounds 会生成两个文件。逐个替换：

**MyApp.swift**（替换全部内容）：

```swift
import SwiftUI

@main
struct StarterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

**ContentView.swift**（替换全部内容）：

```swift
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "iphone")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("iOS App 就绪 🚀")
                .font(.title)
                .fontWeight(.bold)
            
            Text("由 Hermes + Playgrounds 驱动")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
                .padding(.horizontal, 40)
            
            Text("点击了 \(tapCount) 次")
                .font(.headline)
            
            Button(action: { tapCount += 1 }) {
                Label("点我测试", systemImage: "hand.tap.fill")
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Text("修改此文件即可迭代你的 App")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 20)
        }
        .padding()
    }
}
```

### 4. 运行

- 点右上角 **▶️ 运行**
- 等待编译（第一次 30 秒左右，之后秒级刷新）
- App 会在 iPad 上以**全屏模式**启动
- 点击按钮看计数器变化

### 5. 后续开发

- 修改 `ContentView.swift` → 点 ▶️ → 即时看到效果
- 新建 Swift 文件：点左下角 "+" → "Swift 文件"
- App 会出现在 iPad 桌面，像真正的 App 一样

## 和 GitHub 流水线的分工

|              | iPad Playgrounds         | GitHub Actions (等新证书) |
|--------------|--------------------------|---------------------------|
| 用途         | 日常开发 + 即时预览       | 正式打包 + 分发            |
| 成本         | 免费                      | $99/年                    |
| 证书         | 不需要                    | 需要 .p12                 |
| 安装到 iPhone| 仅 iPad 上运行            | 任何设备                   |
| 上架         | 可提交到 App Store         | 可走 CI 自动化             |

## 小提示

- Swift Playgrounds 支持**完整 SwiftUI**，包括手势、动画、网络请求、Core Data
- 代码可以直接从 iPad 通过 iCloud 或隔空投送导出到电脑
- 当你的证书续费后，这些代码**直接复制回 GitHub 仓库**，CI 流水线就能打包

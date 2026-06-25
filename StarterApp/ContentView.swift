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
            
            Text("由 Hermes + GitHub Actions 构建")
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
            
            Text("修改 ContentView.swift 开始你的 App")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

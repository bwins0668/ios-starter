# iOS 真机构建：证书配置指南

你的签名证书（.p12 + .mobileprovision）在上传到 GitHub 之前需要 Base64 编码。

## 你需要准备的 4 个 Secret

| Secret 名称 | 内容 | 怎么获取 |
|------------|------|---------|
| `BUILD_CERTIFICATE_BASE64` | .p12 文件的 Base64 | `base64 -i cert.p12` |
| `P12_PASSWORD` | .p12 导出时设的密码 | 你自己设的 |
| `KEYCHAIN_PASSWORD` | CI 临时钥匙串密码 | 随便设一个（如 `build123`） |
| `BUILD_PROVISION_PROFILE_BASE64` | .mobileprovision 的 Base64 | `base64 -i profile.mobileprovision` |

## 步骤

### 1. 在 Windows 上编码证书

打开 Git Bash，进入证书所在目录：

```bash
# 编码 .p12 证书（复制输出）
base64 -i 你的证书.p12

# 编码 .mobileprovision 描述文件（复制输出）
base64 -i 你的描述文件.mobileprovision
```

### 2. 添加到 GitHub Secrets

```
https://github.com/bwins0668/ios-starter/settings/secrets/actions
```

点 "New repository secret"，依次添加：

| Name | Value |
|------|-------|
| `BUILD_CERTIFICATE_BASE64` | 第一步的 .p12 Base64 输出 |
| `P12_PASSWORD` | 证书导出密码 |
| `KEYCHAIN_PASSWORD` | 随便设一个（如 `iosbuild2026`） |
| `BUILD_PROVISION_PROFILE_BASE64` | 第一步的 .mobileprovision Base64 输出 |

### 3. 手动触发构建

添加完 Secret 后：

1. 打开 Actions → iOS Build & Sign
2. 点 "Run workflow"
3. 选择分发方式：
   - `development` — 开发测试（需要设备 UDID 在描述文件里）
   - `ad-hoc` — 内部分发
   - `app-store` — 正式发布

### 4. 安装到 iPhone

构建完成后，下载 `StarterApp.ipa`，用以下任一方式安装：

- **Apple Configurator**（Windows 可用）
- **爱思助手**（Windows）
- **AltStore**（需 Mac 端一次性配置）
- **Xcode → Devices**（Mac 上直接拖）

# OpenMind OM1 一键安装脚本（macOS 新手友好版）

🚀 **一个超级简单的 Bash 脚本，帮助完全零基础的小白在 Mac 上快速安装并运行 OpenMind OM1 的 Spot agent（虚拟机器人节点）！**

Spot agent 会用你的摄像头识别物体、调用 AI 模型思考，然后在浏览器里模拟机器人动作走路、说话、表情等

这个脚本会自动：
- 安装 Homebrew
- 安装必要工具uv、portaudio、ffmpeg
- 克隆官方 OM1 仓库
- 创建虚拟环境
- 帮你配置 API Key
- 直接启动 Spot node

## 为什么用这个脚本？
- 这个脚本一键搞定，全程有中文提示
- 适合完全不懂技术的朋友，几分钟就能玩起来

## 系统要求
- **macOS** 系统
- 有摄像头（Spot 需要用摄像头看东西）
- 网络正常

## 使用方法

1. 把脚本保存到桌面（文件名：`install_om1.sh`）
   - 用「文本编辑」打开，新建文件 → 粘贴脚本代码 → 存储到桌面（记得选「纯文本」格式）

2. 打开「终端」（在 Launchpad 搜索 Terminal）

3. 在终端输入以下两行命令复制粘贴，按回车执行：
   ```bash
   cd ~/Desktop
   bash install_om1.sh
   
脚本运行过程中会提示你输入 OpenMind API Key：
打开浏览器访问 https://portal.openmind.org
登录后，创建一个免费 API Key，粘贴到终端里就行

打开浏览器访问 http://localhost:8000
你就能看到虚拟机器人 Spot 在动啦！

想停止运行：回到终端按 Ctrl + C


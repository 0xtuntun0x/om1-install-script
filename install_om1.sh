#!/bin/bash

set -e  # 遇到错误自动停止

echo "OpenMind OM1 Node 安装开始（推荐运行 Spot agent）..."
sleep 2

# 1. 安装 Homebrew（如果没有）
if ! command -v brew &> /dev/null; then
    echo "正在安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. 安装必要依赖
echo "安装依赖（uv, portaudio, ffmpeg）..."
brew install uv portaudio ffmpeg git -q

# 3. 克隆官方仓库（正确地址）
cd ~
if [ ! -d "OM1" ]; then
    echo "克隆 OpenMind OM1 仓库..."
    git clone https://github.com/OpenMind/OM1.git
else
    echo "OM1 文件夹已存在，跳过克隆..."
fi

cd OM1
git pull  # 更新到最新版本
git submodule update --init --recursive

# 4. 创建虚拟环境
echo "创建虚拟环境..."
uv venv

# 5. 配置 API Key
echo ""
read -p "请粘贴你的 OpenMind API Key（从 https://portal.openmind.org 获取）: " API_KEY
echo ""

if [ ! -f ".env" ]; then
    cp env.example .env
fi

# 替换或添加 OM_API_KEY
sed -i '' "s|^OM_API_KEY=.*|OM_API_KEY=\"$API_KEY\"|" .env || echo "OM_API_KEY=\"$API_KEY\"" >> .env

echo "API Key 已保存到 .env 文件！"
echo "--------------------------------"
grep OM_API_KEY .env
echo "--------------------------------"
echo ""

# 6. 启动 Spot node/agent
echo "✅ 一切准备就绪，正在启动 Spot agent（虚拟机器人节点）..."
echo "启动后，请打开浏览器访问 http://localhost:8000 查看 WebSim 界面"
echo "Spot 会用摄像头识别物体并模拟动作，按 Ctrl+C 停止"
sleep 3

uv run src/run.py spot

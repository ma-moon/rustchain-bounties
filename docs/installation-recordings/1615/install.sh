#!/bin/bash
# RustChain Miner Installation Demo
# This script demonstrates the complete installation process

set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║     RustChain Miner Installation Demo                  ║"
echo "║     Recording for Issue #1615                          ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Step 1: Check prerequisites
echo "📋 Step 1: Checking prerequisites..."
export PATH="$HOME/.cargo/bin:$PATH"

if command -v cargo &> /dev/null; then
    echo "✅ Rust/Cargo installed:"
    cargo --version
    rustc --version
else
    echo "❌ Rust not found. Please install Rust first:"
    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi
echo ""

# Step 2: Clone repository
echo "📦 Step 2: Cloning RustChain repository..."
if [ ! -d "rustchain-bounties" ]; then
    git clone https://github.com/Scottcjn/rustchain-bounties.git
    echo "✅ Repository cloned successfully"
else
    echo "✅ Repository already exists"
fi
cd rustchain-bounties/rustchain-miner
echo ""

# Step 3: Build the miner
echo "🔨 Step 3: Building rustchain-miner (release mode)..."
echo "   This may take a few minutes..."
cargo build --release 2>&1 | tail -5
echo "✅ Build complete!"
echo ""

# Step 4: Verify binary
echo "📍 Step 4: Verifying binary..."
ls -lh target/release/rustchain-miner
echo "✅ Binary created successfully"
echo ""

# Step 5: Test run
echo "🧪 Step 5: Running fingerprint test..."
./target/release/rustchain-miner --test-only 2>&1 | head -20
echo ""

# Step 6: Show help
echo "❓ Step 6: Showing available options..."
./target/release/rustchain-miner --help 2>&1 | head -30
echo ""

echo "╔════════════════════════════════════════════════════════╗"
echo "║     ✅ Installation Complete!                          ║"
echo "║     The miner is ready to use.                         ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  - Run with: ./target/release/rustchain-miner --wallet YOUR_WALLET"
echo "  - For production: sudo cp target/release/rustchain-miner /usr/local/bin/"
echo ""

# RustChain Installation Recording - Issue #1615

## Overview
This directory contains the installation recording for RustChain miner as requested in issue #1615.

## Files
- `installation.cast` - Asciinema recording of the complete installation process
- `installation.svg` - Visual representation of the terminal session
- `install.sh` - Installation script used in the recording

## Installation Steps Recorded

1. **Check prerequisites** - Verify Rust/Cargo installation
2. **Clone repository** - Download rustchain-bounties from GitHub
3. **Build miner** - Compile with `cargo build --release`
4. **Verify binary** - Confirm the executable was created
5. **Test run** - Execute fingerprint test with `--test-only` flag
6. **Show help** - Display available command-line options

## How to View

### Option 1: Play locally with asciinema
```bash
asciinema play installation.cast
```

### Option 2: View SVG
Open `installation.svg` in any web browser.

### Option 3: Upload to asciinema.org
```bash
asciinema upload installation.cast
```

## Installation Commands

```bash
# Clone the repository
git clone https://github.com/Scottcjn/rustchain-bounties.git
cd rustchain-bounties/rustchain-miner

# Build the miner
cargo build --release

# Test the installation
./target/release/rustchain-miner --test-only

# Start mining (replace with your wallet name)
./target/release/rustchain-miner --wallet YOUR_WALLET
```

## System Requirements
- Rust 1.70+ (cargo, rustc)
- Git
- Linux/macOS/Windows

## Recording Details
- Duration: ~2 minutes
- Terminal: 80x24
- Shell: bash
- Recorded: 2026-03-13

## Notes
The recording demonstrates a clean installation from scratch, showing all steps needed for a new user to get started with RustChain mining.

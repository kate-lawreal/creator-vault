# CreatorVault

## Next-Generation Creator Economy Platform

A revolutionary Bitcoin-secured smart contract ecosystem that transforms digital content creation through verifiable reputation mechanics, automated reward distribution, and dynamic NFT-powered membership systems built on Stacks blockchain infrastructure.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Clarity](https://img.shields.io/badge/clarity-v2-orange.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

---

## 🌟 Overview

CreatorVault reimagines the creator economy by establishing a trustless, Bitcoin-backed platform where content creators and their communities interact through programmable smart contracts. The protocol introduces innovative reputation algorithms with time-based decay mechanisms, incentivized engagement through microtransaction rewards, and exclusive NFT certificates that unlock tiered access to creator content and platform governance.

## 🚀 Revolutionary Features

- **Dynamic Reputation Scoring**: Intelligent decay algorithms ensure reputation remains current and meaningful
- **Automated Tip Distribution**: Creator-defined reward parameters with seamless STX transfers
- **Exclusive NFT Certificates**: On-chain verification for reputation and membership status
- **Multi-Tier Access Control**: Customizable benefits system with Bronze through Platinum tiers
- **Anti-Spam Mechanisms**: Engagement cooldowns and validation systems prevent abuse
- **Emergency Governance**: Treasury management with owner controls for platform stability
- **Bitcoin-Finalized Security**: Leverages Stacks L2 architecture for maximum security

---

## 🏗️ Architecture

### Core Components

#### Smart Contract Structure

```text
CreatorVault Contract
├── Error Constants
├── Contract Configuration
├── State Variables
├── NFT Definitions
├── Data Storage Maps
├── Utility Functions
├── Read-Only Functions
├── Internal Logic Functions
├── User Interaction Functions
├── NFT Minting Functions
├── Creator Management Functions
├── Administrative Functions
└── Membership Tier Initialization
```

#### Key Data Structures

##### User Profiles

- Reputation score with time-based decay
- Activity tracking and engagement metrics
- NFT ownership records
- Earnings history

##### Creator Settings

- Customizable earning thresholds
- Reward per engagement configuration
- Activity status management
- Distribution tracking

##### Membership Tiers

- Bronze (1,000+ reputation): Basic access
- Silver (2,000+ reputation): Enhanced access + exclusive content
- Gold (5,000+ reputation): Premium access + governance rights
- Platinum (8,000+ reputation): Full access + revenue sharing

---

## 📊 Contract Constants

| Constant | Value | Description |
|----------|--------|-------------|
| `REPUTATION-DECAY-PERIOD` | 144 blocks | ~24 hours reputation decay cycle |
| `ENGAGEMENT-COOLDOWN` | 6 blocks | ~1 hour spam prevention cooldown |
| `MIN-TIP-AMOUNT` | 1,000,000 μSTX | Minimum tip amount (1 STX) |
| `MAX-REPUTATION-SCORE` | 10,000 | Maximum achievable reputation |

---

## 🔧 Core Functions

### User Functions

#### `initialize-user-profile`

Creates a new user profile with starting reputation of 100 points.

#### `tip-creator (creator: principal, amount: uint)`

Send STX tips to creators with automatic reputation updates.

- **Parameters**: Target creator principal, tip amount in μSTX
- **Effects**: Transfers STX, updates reputation, records engagement

#### `engage-with-creator (creator: principal, engagement-type: string-ascii)`

Interact with creators through various engagement types.

- **Valid Types**: "like", "share", "comment", "follow"
- **Effects**: Updates reputation, prevents spam through cooldowns

### Creator Functions

#### `setup-creator-profile (threshold: uint, reward-per-engagement: uint)`

Initialize creator profile with custom reward parameters.

#### `update-creator-settings (threshold: uint, reward: uint)`

Modify creator reward settings and thresholds.

#### `toggle-creator-status`

Enable/disable creator profile activation.

### NFT Functions

#### `mint-reputation-certificate`

Mint NFT certificate for users with 500+ reputation.

#### `mint-membership-certificate`

Mint tier-based membership NFT for users with 1000+ reputation.

---

## 📈 Reputation System

### Scoring Mechanism

- **Base Reputation**: Starting score of 100 points
- **Tipping Rewards**: +50 points for tippers, +100 for recipients
- **Engagement Rewards**: +25 points for users, +50 for creators
- **Maximum Cap**: 10,000 reputation points

### Time-Based Decay

Reputation naturally decays over 144 blocks (~24 hours) of inactivity:

```clarity
decay-factor = blocks-since-activity / REPUTATION-DECAY-PERIOD
new-reputation = max(0, base-reputation - decay-factor)
```

### Tier Calculation

```clarity
Platinum: 8,000+ reputation
Gold:     5,000+ reputation  
Silver:   2,000+ reputation
Bronze:   1,000+ reputation
```

---

## 💰 Economic Model

### STX Flow

1. **User Tips Creator**: Direct STX transfer
2. **Engagement Rewards**: Automated distribution to active users
3. **Treasury Management**: Emergency withdrawal capabilities
4. **Revenue Sharing**: Tier-based benefit distribution

### Anti-Spam Protection

- Engagement cooldown periods
- Minimum tip thresholds
- Validation of interaction types
- Reputation-based access controls

---

## 🛡️ Security Features

### Access Control

- Contract owner administrative functions
- Emergency pause/unpause mechanisms
- Tiered permission system

### Error Handling

Comprehensive error constants for all failure scenarios:

```clarity
ERR-UNAUTHORIZED (u100)
ERR-ALREADY-EXISTS (u101)
ERR-NOT-FOUND (u102)
ERR-INSUFFICIENT-BALANCE (u103)
ERR-INVALID-AMOUNT (u104)
ERR-INVALID-THRESHOLD (u105)
ERR-INVALID-TIER (u106)
ERR-COOLDOWN-ACTIVE (u107)
ERR-EXPIRED-REPUTATION (u108)
```

---

## 🚀 Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) CLI tool
- Node.js 16+ for testing framework
- Stacks wallet for interaction

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/kate-lawrence/creator-vault.git
   cd creator-vault
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Run contract checks**

   ```bash
   clarinet check
   ```

4. **Execute tests**

   ```bash
   npm test
   ```

### Local Development

1. **Start Clarinet console**

   ```bash
   clarinet console
   ```

2. **Deploy contract locally**

   ```bash
   ::deploy_contract contracts/creator-vault.clar
   ```

3. **Interact with functions**

   ```bash
   (contract-call? .creator-vault initialize-user-profile)
   ```

---

## 🧪 Testing

The project includes comprehensive test coverage using Vitest and @hirosystems/clarinet-sdk.

### Run Tests

```bash
npm test
```

### Test Coverage

- User profile initialization
- Creator setup and configuration
- Tipping functionality with reputation updates
- Engagement tracking and validation
- NFT minting for certificates
- Administrative functions
- Error handling scenarios

---

## 📖 API Reference

### Read-Only Functions

| Function | Parameters | Returns | Description |
|----------|------------|---------|-------------|
| `get-user-profile` | `user: principal` | `(optional user-profile)` | Retrieve user profile data |
| `get-creator-settings` | `creator: principal` | `(optional creator-settings)` | Get creator configuration |
| `get-current-reputation` | `user: principal` | `(response uint uint)` | Calculate current reputation with decay |
| `get-membership-tier` | `tier-id: uint` | `(optional tier-info)` | Retrieve tier configuration |
| `calculate-tier-for-reputation` | `reputation: uint` | `uint` | Determine tier from reputation |
| `is-contract-paused` | - | `bool` | Check contract pause status |

### Public Functions

| Function | Access | Description |
|----------|---------|-------------|
| `initialize-user-profile` | Any user | Create new user profile |
| `setup-creator-profile` | Any user | Initialize creator settings |
| `tip-creator` | Any user | Send STX tips to creators |
| `engage-with-creator` | Any user | Interact with creator content |
| `mint-reputation-certificate` | Qualified users | Mint reputation NFT |
| `mint-membership-certificate` | Qualified users | Mint membership NFT |
| `pause-contract` | Owner only | Emergency pause mechanism |
| `emergency-withdraw` | Owner only | Treasury management |

---

## 🔮 Roadmap

### Phase 1: Core Platform (Current)

- ✅ Reputation system with decay mechanics
- ✅ Tipping and engagement functionality
- ✅ NFT certificate system
- ✅ Multi-tier membership structure

### Phase 2: Enhanced Features

- [ ] Content access control integration
- [ ] Governance token distribution
- [ ] Cross-chain bridge capabilities
- [ ] Advanced analytics dashboard

### Phase 3: Ecosystem Expansion

- [ ] Third-party integrations
- [ ] Mobile SDK development
- [ ] Marketplace for creator assets
- [ ] Institutional creator tools

---

## 🤝 Contributing

We welcome contributions from the community! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting pull requests.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add/update tests
5. Submit a pull request

### Code Standards

- Follow Clarity best practices
- Include comprehensive tests
- Document all public functions
- Use descriptive commit messages

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Stacks Foundation** for blockchain infrastructure
- **Hiro Systems** for development tools
- **Bitcoin Community** for security and decentralization inspiration
- **Creator Economy** pioneers who inspire platform innovation

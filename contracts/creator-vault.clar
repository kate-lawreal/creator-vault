;; CreatorVault - Next-Generation Creator Economy Platform
;;
;; Summary:
;; A revolutionary Bitcoin-secured smart contract ecosystem that transforms digital content
;; creation through verifiable reputation mechanics, automated reward distribution, and 
;; dynamic NFT-powered membership systems built on Stacks blockchain infrastructure.
;;
;; Description:
;; CreatorVault reimagines the creator economy by establishing a trustless, Bitcoin-backed
;; platform where content creators and their communities interact through programmable
;; smart contracts. The protocol introduces innovative reputation algorithms with time-based
;; decay mechanisms, incentivized engagement through microtransaction rewards, and exclusive
;; NFT certificates that unlock tiered access to creator content and platform governance.
;;
;; Revolutionary Features:
;; - Dynamic reputation scoring with intelligent decay algorithms
;; - Automated tip distribution with creator-defined reward parameters  
;; - Exclusive NFT certificates for reputation and membership verification
;; - Multi-tier access control system with customizable benefits
;; - Anti-spam engagement cooldowns and validation systems
;; - Emergency governance controls with treasury management
;; - Bitcoin-finalized security through Stacks L2 architecture
;;
;; Built for the future of decentralized content monetization.

;; ERROR CONSTANTS

(define-constant ERR-UNAUTHORIZED (err u100))
(define-constant ERR-ALREADY-EXISTS (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-BALANCE (err u103))
(define-constant ERR-INVALID-AMOUNT (err u104))
(define-constant ERR-INVALID-THRESHOLD (err u105))
(define-constant ERR-INVALID-TIER (err u106))
(define-constant ERR-COOLDOWN-ACTIVE (err u107))
(define-constant ERR-EXPIRED-REPUTATION (err u108))

;; CONTRACT CONFIGURATION

(define-constant CONTRACT-OWNER tx-sender)
(define-constant REPUTATION-DECAY-PERIOD u144) ;; ~24 hours in blocks
(define-constant ENGAGEMENT-COOLDOWN u6) ;; ~1 hour in blocks  
(define-constant MIN-TIP-AMOUNT u1000000) ;; 1 STX in microSTX
(define-constant MAX-REPUTATION-SCORE u10000) ;; Maximum achievable reputation

;; STATE VARIABLES

(define-data-var contract-paused bool false)
(define-data-var total-reputation-nfts uint u0)
(define-data-var total-membership-nfts uint u0)
(define-data-var treasury-balance uint u0)

;; NFT DEFINITIONS

(define-non-fungible-token reputation-nft uint)
(define-non-fungible-token membership-nft uint)

;; DATA STORAGE MAPS

(define-map user-profiles
  principal
  {
    reputation-score: uint,
    last-activity-block: uint,
    total-earnings: uint,
    engagement-count: uint,
    reputation-nft-id: (optional uint),
    membership-nft-id: (optional uint),
  }
)

(define-map creator-settings
  principal
  {
    earnings-threshold: uint,
    reward-per-engagement: uint,
    is-active: bool,
    total-distributed: uint,
  }
)

(define-map engagement-history
  {
    user: principal,
    target: principal,
    stacks-block-height: uint,
  }
  {
    engagement-type: (string-ascii 20),
    amount: uint,
    processed: bool,
  }
)

(define-map membership-tiers
  uint
  {
    tier-name: (string-ascii 50),
    min-reputation: uint,
    benefits: (string-ascii 200),
    access-level: uint,
  }
)
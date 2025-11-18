# SimpleBank 🏦

SimpleBank is a basic smart contract written in Solidity that allows users to **deposit**, **withdraw**, and **check their ETH balance**.  
It includes a **manual reentrancy guard**, follows the **Checks → Effects → Interactions (CEI)** pattern, and emits events for transparency.

This project is part of my journey learning blockchain development and understanding how Ethereum smart contracts handle state updates, ETH transfers, and security considerations.

---

## 🚀 How to Use

1. Deploy the contract in **Remix** (Injected Provider / Hardhat VM / JavaScript VM)
2. Call `deposit()` and send ETH with the transaction
3. Check your balance using `balance()`
4. Withdraw ETH using `withdraw(amount)`

---

## 🧠 Features

- Store ETH on-chain per address
- Withdraw funds safely
- Emits events (`Deposit`, `Withdraw`)
- Uses a `mapping(address → balance)`
- Includes a **manual `nonReentrant` modifier**
- Uses the **CEI pattern** to prevent attack vectors

---

## 🔐 Security Concepts Included

| Concept | Implemented | Notes |
|---------|-------------|-------|
| Checks → Effects → Interactions (CEI) | ✅ | Used in `withdraw()` |
| Reentrancy protection | ✅ | Custom `nonReentrant` modifier |
| Safe ETH transfer | ✅ | Uses `call{value: amount}("")` |
| Events for transparency | ✅ | Useful for indexing and UIs |

---

## 🛠️ Future Improvements

- Add unit testing (Foundry or Hardhat)
- Add ownership and access control (`onlyOwner`)
- Add pause mechanism / circuit breaker pattern
- Deploy on a public testnet (Sepolia or Holesky)
- UI integration using Wagmi / ethers.js / viem

---

## 📚 Purpose

The goal of this project is to **learn by building**, not just reading.  
Starting simple and improving step-by-step mirrors real-world blockchain development.

---

## 📄 License

MIT License 📝

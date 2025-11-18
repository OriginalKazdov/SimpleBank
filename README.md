# SimpleBank 🏦

SimpleBank is a basic smart contract written in Solidity that allows users to **deposit**, **withdraw**, and **check their ETH balance**.

This project is part of my journey learning blockchain development and understanding how the EVM handles value transfers, mappings, and state management.

---

## 🚀 How to Use

1. Deploy the contract in **Remix** (Injected Provider, Hardhat VM, or JavaScript VM)
2. Call `deposit()` and send ETH with the transaction
3. View your balance using `balance()`
4. Withdraw ETH using `withdraw(amount)`

---

## 🧠 Features

- Deposit ETH into the contract
- Withdraw available balance
- Track user balances using a mapping
- View balance tied to the caller (`msg.sender`)

---

## 🛠️ Future Improvements

- Add **security protections** (Reentrancy guard, CEI pattern enforcement)
- Emit **events** (`Deposit`, `Withdraw`) for transparency and indexing
- Deploy on a **public testnet** (Sepolia / Holesky)
- Add unit testing (Hardhat / Foundry)

---

## 📚 Purpose

The goal of this project is to focus on **building**, not just reading theory or following tutorials — applying Solidity fundamentals to create something functional and learn iteratively.

---

## 📄 License

MIT License

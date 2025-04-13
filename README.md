# 🧾 Onchain Invoice Book

A minimal Ethereum-based invoice system. Users can create invoices on-chain, and recipients can pay them directly via the smart contract. Perfect for freelancers, DAOs, or any crypto-native business operations.

---

## 📦 Features

- Create on-chain invoices with recipient, description, and amount.
- Secure payment system using native ETH transfers.
- Full invoice history stored on the blockchain.
- Written in Solidity + Python (`web3.py`).

---

## 🛠 Files

- `InvoiceBook.sol` – Smart contract storing and managing invoices.
- `add_invoice.py` – Python script to create new invoices.
- `view_invoices.py` – Python script to fetch and display all invoices.
- `InvoiceBook_abi.json` – ABI of the compiled contract (generated separately).

---

## 🚀 Getting Started

### 1. Deploy the contract

Use [Remix](https://remix.ethereum.org/) or any framework (e.g. Hardhat, Brownie) to deploy `InvoiceBook.sol`.  
Save the generated ABI to `InvoiceBook_abi.json`.

### 2. Install dependencies

```bash
pip install web3

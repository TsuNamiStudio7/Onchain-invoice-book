from web3 import Web3
import json

w3 = Web3(Web3.HTTPProvider("http://localhost:8545"))
contract_address = "0xYourContractAddressHere"

with open("InvoiceBook_abi.json") as f:
    abi = json.load(f)

contract = w3.eth.contract(address=contract_address, abi=abi)

def view_all_invoices():
    count = contract.functions.invoiceCount().call()
    for i in range(count):
        invoice = contract.functions.getInvoice(i).call()
        print(f"ID: {invoice[0]}")
        print(f"Issuer: {invoice[1]}")
        print(f"Recipient: {invoice[2]}")
        print(f"Description: {invoice[3]}")
        print(f"Amount: {w3.from_wei(invoice[4], 'ether')} ETH")
        print(f"Timestamp: {invoice[5]}")
        print(f"Paid: {invoice[6]}")
        print("-" * 40)

# Example usage:
# view_all_invoices()

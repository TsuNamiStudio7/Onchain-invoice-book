// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvoiceBook {
    struct Invoice {
        uint id;
        address issuer;
        address recipient;
        string description;
        uint amount;
        uint timestamp;
        bool paid;
    }

    Invoice[] public invoices;
    uint public invoiceCount;

    event InvoiceCreated(uint id, address indexed issuer, address indexed recipient, uint amount);
    event InvoicePaid(uint id);

    function createInvoice(address recipient, string calldata description, uint amount) external {
        invoices.push(Invoice({
            id: invoiceCount,
            issuer: msg.sender,
            recipient: recipient,
            description: description,
            amount: amount,
            timestamp: block.timestamp,
            paid: false
        }));
        emit InvoiceCreated(invoiceCount, msg.sender, recipient, amount);
        invoiceCount++;
    }

    function payInvoice(uint id) external payable {
        Invoice storage invoice = invoices[id];
        require(!invoice.paid, "Already paid");
        require(msg.value == invoice.amount, "Incorrect amount");
        require(msg.sender == invoice.recipient, "Not the recipient");

        invoice.paid = true;
        payable(invoice.issuer).transfer(msg.value);
        emit InvoicePaid(id);
    }

    function getInvoice(uint id) external view returns (Invoice memory) {
        return invoices[id];
    }

    function getAllInvoices() external view returns (Invoice[] memory) {
        return invoices;
    }
}

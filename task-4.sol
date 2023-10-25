// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract BootcampToken {
    string public name = "Bootcamp Token";
    string public symbol = "BCT";
    uint8 public decimals = 18; // Tokenın ondalık hanesi 18 olarak ayarlandı
    uint256 public totalSupply = 1000000 * 10**uint256(decimals); // Toplam arz ondalık hanelere göre düzenlendi
    address public owner;
    mapping(address => uint256) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Yetersiz token");
        require(to != address(0), "Geçersiz adres"); // Geçersiz adreslere transferi engellemek için kontrol eklendi

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}

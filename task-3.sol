function getAllAdmins() public view returns (Account[] memory) {
    Account[] memory _admins = new Account[](admins.length);
    for (uint i = 0; i < admins.length; i++) {
        _admins[i] = admins[i];
    }

    return _admins;
}




// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

contract RentalContract {

    // Kiracı bilgileri
    struct Tenant {
        address tenantAddress;
        string name;
        string surname;
        string contactInformation;
    }

    // Adres bilgileri
    struct Location {
        uint256 id;
        string city;
        string district;
        string street;
        string number;
        address ownerAddress;
    }

    // Sahibi bilgileri
    struct Owner {
        address ownerAddress;
        string name;
        string surname;
        string contactInformation;
    }

    // Sözleşme bilgileri
    struct RentalContractInfo {
        uint256 id;
        Location location;
        uint256 startDate;
        uint256 endDate;
        bool isActive;
    }

    // Kiracı bilgileri
    mapping(address => Tenant) public tenants;

    // Adres bilgileri
    mapping(uint256 => Location) public locations;

    // Sahibi bilgileri
    mapping(address => Owner) public owners;

    // Sözleşme bilgileri
    mapping(uint256 => RentalContractInfo) public rentalContracts;
    
    // Yardımcı değişken - Kira sözleşmesi sayısı
    uint256 public rentalContractCount;

    // Kiraya ver
    function rent(uint256 locationId, uint256 startDate, uint256 endDate) public {
        // Adres bilgilerini kontrol et
        require(locations[locationId].id == locationId);

        // Kira başlangıç tarihinin bugünden sonra olduğunu kontrol et
        require(startDate > block.timestamp);

        // Kira bitiş tarihinin kira başlangıç tarihinden sonra olduğunu kontrol et
        require(endDate > startDate);

        // Yeni bir kira sözleşmesi oluştur
        uint256 newContractId = rentalContractCount + 1;

        RentalContractInfo memory rentalContractInfo = RentalContractInfo({
            id: newContractId,
            location: locations[locationId],
            startDate: startDate,
            endDate: endDate,
            isActive: true
        });

        // Kira sözleşmesini kayıt et
        rentalContracts[newContractId] = rentalContractInfo;
        
        // Kira sözleşmesi sayısını artır
        rentalContractCount++;
    }

    // Kiracı Bilgilerini Güncelleme
    function updateTenantInfo(string memory newContactInformation) public {
        tenants[msg.sender].contactInformation = newContactInformation;
    }

    // Kiracı Değiştirme
    function changeTenant(address newTenantAddress) public {
        // Eski kiracıdan yeni kiracıya bilgileri aktar
        tenants[newTenantAddress] = tenants[msg.sender];
        
        // Eski kiracıyı sil
        delete tenants[msg.sender];
    }

    // Kiralama Sözleşmesi Uzatma
    function extendRentalContract(uint256 rentalContractId, uint256 newEndDate) public {
        // Sözleşme sahibini kontrol et
        require(owners[msg.sender].ownerAddress == rentalContracts[rentalContractId].location.ownerAddress);

        // Kira bitiş tarihini güncelle
        rentalContracts[rentalContractId].endDate = newEndDate;
    }

    // Kiralama Sözleşmesi İptali
    function cancelRentalContract(uint256 rentalContractId) public {
        // Sözleşme sahibini kontrol et
        require(owners[msg.sender].ownerAddress == rentalContracts[rentalContractId].location.ownerAddress);

        // Sözleşmeyi iptal et
        rentalContracts[rentalContractId].isActive = false;
    }

    // Kira Sözleşmesi Bilgilerini Alma
    function getRentalContractInfo(uint256 rentalContractId) public view returns (RentalContractInfo memory) {
        return rentalContracts[rentalContractId];
    }

    // Kiracı Bilgilerini Alma
    function getTenantInfo(address tenantAddress) public view returns (Tenant memory) {
        return tenants[tenantAddress];
    }

    // Adres Bilgilerini Alma
    function getLocationInfo(uint256 locationId) public view returns (Location memory) {
        return locations[locationId];
    }

    // Sahip Bilgilerini Alma
    function getOwnerInfo(address ownerAddress) public view returns (Owner memory) {
        return owners[ownerAddress];
    }
}

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

// Import openzeppelin contract
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";

contract MyBurnableNFT is ERC721 {
    uint256 public id = 0;

    constructor() ERC721("MyBurnableNFT", "MBNFT") {
        console.log("This is my Burnable NFT Contract");
    }

    function makeAnNFT() public {
        id++;
        _mint(msg.sender, id);
    }

    function burnNFT(uint256 tokenId) public {
        require(
            _isApprovedOrOwner(msg.sender, tokenId),
            "Caller is not token owner or approved"
        );
        _burn(tokenId);
    }
}

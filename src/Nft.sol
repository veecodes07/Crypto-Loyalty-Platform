// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Nft is ERC721, Ownable {
    uint256 private s_tokenCounter;
    uint256 private maxMintAmount;
    mapping(uint256 => string) private s_tokenIdToUri;
       uint256 public liquidityPoolBalance; // Track the liquidity pool balance

       event MintedWithTimestamp(
        address indexed minter,
        uint256 indexed tokenId,
        string tokenUri,
        uint256 timestamp
    );

    constructor() ERC721("ProNFT", "PNFT" ) {
        s_tokenCounter = 0;
        maxMintAmount = 10;
          liquidityPoolBalance = 0; // Initialize the liquidity pool balance
    }

    

    function mintNFT(string memory tokenUri ) public payable {
       require(msg.value >= 0.1 ether, "Insufficient payment"); // Adding a payment requirement of at least 0.1 ether
      //uint256 _mintAmount;
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
       //
      uint256 timestamp = block.timestamp; // Get the current block timestamp
     // Additional logic to display the timestamp
    emit MintedWithTimestamp(msg.sender, s_tokenCounter - 1, tokenUri, timestamp);

    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    //owner funcs

    //function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner {
  //  maxMintAmount = _newmaxMintAmount;
  //}

    // Function to allow the owner to add more liquidity
    function addLiquidity() public payable onlyOwner {
        require(msg.value > 0, "No funds sent");
        liquidityPoolBalance += msg.value;
    }

}








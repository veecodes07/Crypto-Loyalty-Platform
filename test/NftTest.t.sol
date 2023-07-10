// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

import {Test} from "forge-std/Test.sol";

import {Nft} from "../src/Nft.sol";
import {DeployNft} from "../script/DeployNft.s.sol";




  /*
contract NftTest is Test {
  
     Nft nft;

    function setUp() public {
        nft = new Nft();
    }

    function testMintNFT() public {
  // Arrange
  string memory tokenUri = "https://example.com/token.uri";

  // Act
  nft.mintNFT(tokenUri);

  // Assert
  uint256 tokenId = nft.totalSupply();
  assert(nft.tokenURI(tokenId) == tokenUri);
}

    function testAddLiquidity() public {
        // Arrange
        uint256 amount = 1000000000000000000 wei;

        // Act
        nft.addLiquidity();

        // Assert
        assert(nft.liquidityPoolBalance() == amount);
    }
    */

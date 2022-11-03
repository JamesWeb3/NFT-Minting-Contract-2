// SPDX-License-Identifer: MIT

pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract RoboPunksNFT is ERC721, Ownable { //RoboPunks contract is going to be inheriting from ERC721 and ownable Openzeppelin contracts
    uint256 public mintPrice; //these storage variables can cost your project a lot of ethereum
    uint256 public totalSupply; //current number of NFT's while your minting
    uint256 public maxSupply; //maximum number of NFTs in the collection
    uint256 public maxPerWallet; //max allowed to mint per wallet
    bool public isPublicMintEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;
    mapping(address => uint256) public walletMints; //this wil determine and keep track of all the mints. This is much better thaen tracking the number of mints in wallet.abi

    constructor() payable ERC721('RoboPunks', 'RP') {
        mintPrice = 0.02 ether;
        totalSupply = 0;
        maxSupply = 1000;
        maxPerWallet = 3;
        //set withdraw wallet address
    }

    function setIsPublicMintEnabled(bool PublicMintEnabled_) external onlyOwner {
        isPublicmintEnabled = isPublicMintEnabled_;
    }

    function setBaseTokenURI(string calldata baseTokenUri_) external onlyOwner {
        baseTokenUri = baseTokenUri_;
    }

    function tokenURI(uint256 tokenId_) public view override returns (string memory) {
        require(_exists(tokenId_) 'Token does not exist'),
        return string(abi.encodePacked(baseTokenUri, Strings.toString(tokenId_)".Json") //we are taking the base tokenUri and getting the ID and placing it behin the URL and attatch.Json to the end of it

    function withdrawl()external onlyOwner {
        (bool success,) = withdrawlWallet.call{value: address(this.balance } (""))}
        require(success, 'withdraw failed');
        
    }

    //MINT FUNCTION IS ONE OF THE MOST IMPORTANT PARTS OF THE CONTRACT
    function mint(uint256 quantity_) public payable {
        require(isPublicMintEnabled, 'minting not enabled'); //we need to make sure it is set to true before people can mint
        require(msg.value == quantity_ * mintPrice, 'wrong mint value') //This is making sure the user puts in the correct value, msg.
        require(totalSupply + quantity_ <= maxSupply, 'sold out'); // So people cant mint past supply (999 + 10 wouldnt work)
        require(walletMints[msg.sender] + quantity_ <= maxPerWallets, 'exceed max per wallet') //THIS FUNCTION SOLVES THE EVO APES PROBLEM. Making a require statement will stop then from transferiing NFTs to other wallet and reminting

        for (uint256 i = 0; i < quantity_; i++) {//this will be a loop and where we actualyl mint the NFT
         uint256 newTokenId = totalSupply + 1; //we are grabbing the total supply and adding one to specify the token ID you are going to mint
         totalSupply++;
         _safeMint(msg.sender, newTokenId);//safeMint is a function that exists in the ERC721 contract. We pass in the address that is going to receive the NFT and pass in the latest tokenID withnewTokenID. Make sure to increement the supply to keep track of it properly

        }


    }

    

    


}

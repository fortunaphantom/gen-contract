// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GenNft is ERC721 {
    mapping(uint256 tokenId => string) private _tokenUris;
    uint256 private _counter = 0;

    constructor() ERC721("GenNft", "GEN") {}

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireOwned(tokenId);
        return _tokenUris[tokenId];
    }

    function mint(string memory _tokenUri) external payable {
        _counter++;
        _safeMint(msg.sender, _counter);
        _tokenUris[_counter] = _tokenUri;
    }
}

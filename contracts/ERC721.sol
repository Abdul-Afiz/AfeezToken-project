//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string public baseURI;
  string public baseExtension = ".json";

  constructor(
    string memory _name,
    string memory _symbol
  ) ERC721(_name, _symbol) {  }

  // internal
  function _baseURI() internal view virtual override returns (string memory) {
    return "https://ipfs.io/ipfs/QmZjgNRNAVdWaVKF7oCoLUkho5h6TZgkstP9yL5Dwuu21h/";
  }

  // public
  function mint(address _to) public payable {
    uint256 supply = totalSupply();
      _safeMint(_to, supply + 1);
  }

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(
      _exists(tokenId),
      "ERC721Metadata: URI query for nonexistent token"
    );

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
        : "";
  }
}
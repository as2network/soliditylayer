
pragma solidity ^0.7.4;
pragma experimental ABIEncoderV2;

abstract contract InterchangeEnvelope {

    bytes public anchors;

// ISA Portion of EDI message
    struct ISASetWithSignature {
        bytes isaset;
        bytes sig;
    }

    event AlgorithmUpdated(uint8 id, address addr);
    event DigestUpdated(uint8 id, address addr);
    event TradingChannelUpdated(uint8 id, address addr);
    event ISASetUpdated(bytes name, bytes isaset);

    function submitISASets(bytes calldata data, bytes calldata proof) public virtual returns (bytes memory);
    function submitISASet(ISASetWithSignature calldata input, bytes calldata proof) public virtual returns (bytes memory);
    function deleteISASet(uint16 deleteType, bytes calldata deleteName, ISASetWithSignature calldata nsec, bytes calldata proof) public virtual;
    function deleteISASetNSEC3(uint16 deleteType, bytes memory deleteName, ISASetWithSignature memory closestEncloser, ISASetWithSignature memory nextClosest, bytes memory dnskey) public virtual;
    function isadata(uint16 dnstype, bytes calldata name) external virtual view returns (uint32, uint64, bytes20);
}

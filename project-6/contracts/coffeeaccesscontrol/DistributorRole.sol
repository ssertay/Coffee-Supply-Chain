// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Roles.sol";

contract DistributorRole {
  using Roles for Roles.Role;

  event DistributorAdded(address indexed account);
  event DistributorRemoved(address indexed account);

  Roles.Role private distibutors;

  constructor() {
    _addDistributor(msg.sender);
  }

  modifier onlyDistributor() {
    require(isDistributor(msg.sender), "msg.sender should be a distributor.");
    _;
  }

  function isDistributor(address account) public view returns (bool) {
    return distibutors.has(account);
  }

  function addDistributor(address account) public onlyDistributor {
    _addDistributor(account);
  }

  function renounceDistributor() public {
    _removeDistributor(msg.sender);
  }

  function _addDistributor(address account) internal {
    distibutors.add(account);
    emit DistributorAdded(account);
  }

  function _removeDistributor(address account) internal {
    distibutors.remove(account);
    emit DistributorRemoved(account);
  }
}
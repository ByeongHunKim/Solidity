//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract event_test {

    event info(string name, uint256 money);

    function sendMoney() public {
	    emit info("hunsman", 1000);
    }
}
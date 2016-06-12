contract UpgradableToken {
    
    event BurnedTokensForNewVersion( address convertingAddress, uint256 amount );

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    address public createdBy;
    
    // if this contract has been upgraded
    // shows the new contracts address
    address public newContractAddress;
    bool public isConfirmed;

    modifier createdBySender() {
        if (createdBy != msg.sender) throw;
        _
    }

    modifier newContractConfirmed() {
        if (isConfirmed) throw;
        _
    }

    function UpgradableToken() {
        createdBy = msg.sender;
    }

    function setNewContractAddress(address _newContractAddress)
        createdBySender
        newContractConfirmed {
        
        newContractAddress = _newContractAddress;
    }

    function confirmNewContractAddress(address _newContractAddress)
        createdBySender
        newContractConfirmed {
        
        isConfirmed = true;
    }

    function burnTokensForNewVersion(uint256 _value) {
        /* Check if sender has balance and for overflows */
        if (balanceOf[msg.sender] < _value) throw;
        if (_value < 0) throw;

        balanceOf[msg.sender] -= _value;
        BurnedTokensForNewVersion(msg.sender, _value);
    }

    function mintFromBurnedTokens(
        uint256 _logIndex, // integer of the log index position in the block.
        uint256 _tranIndex, // integer of the transactions index position log was created from.
        string _tranHash, // 32 Bytes - hash of the transactions this log was created from.
        address _address, // 32 Bytes - address from which this log originated.
        string _blockHash, // 32 Bytes - hash of the block where this log was in. null when its pending.
        uint256 _blockNumber) { // the block number where this log was in. null when its pending.

        // todo: get address and number of tokens burned to add to the balanceOf[_address]
        var amountFromLog = 1001;
        balanceOf[_address] += amountFromLog;
    }
}
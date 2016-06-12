import './upgradable-token.sol';

contract MyToken is UpgradableToken {
    
    string public name = "Embark Token 2.0.0";
    string public symbol = "ET_2-0-0";
    uint8 public decimals = 5;

    function MyToken() {
        balanceOf[msg.sender] = 100000000000;
    }

    function transfer(address _to, uint256 _value) {

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}
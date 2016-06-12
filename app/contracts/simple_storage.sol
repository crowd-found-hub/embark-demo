contract SimpleStorage {
  uint public storedData;

  function SimpleStorage(uint initialValue) {
    storedData = initialValue;
  }

  function set(uint x) {
    var tempData = x * 2;
    storedData = tempData;
  }

  function get() constant returns (uint retVal) {
    return storedData;
  }
}

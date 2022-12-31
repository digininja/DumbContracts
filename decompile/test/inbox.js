const Inbox = artifacts.require("Inbox");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Inbox", function (/* accounts */) {
  it("should assert true", async function () {
    await Inbox.deployed();
    return assert.isTrue(true);
  });
});

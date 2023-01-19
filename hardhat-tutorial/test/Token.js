// Notes

// All this code is coming from here:
// https://hardhat.org/tutorial/testing-contracts

// Useful guide on matchers
// https://ethereum-waffle.readthedocs.io/en/latest/matchers.html

const { expect } = require("chai");

describe("Token contract test 1", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });

  it("Should transfer tokens between accounts", async function() {
    const [owner, addr1, addr2] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    // Transfer 50 tokens from owner to addr1
    await hardhatToken.transfer(addr1.address, 50);
    expect(await hardhatToken.balanceOf(addr1.address)).to.equal(50);

    // Transfer 50 tokens from addr1 to addr2
    await hardhatToken.connect(addr1).transfer(addr2.address, 50);
    expect(await hardhatToken.balanceOf(addr2.address)).to.equal(50);

	// Check the balance of addr1 is now 0
    expect(await hardhatToken.balanceOf(addr1.address)).to.equal(0);
  });

  it("Should not transfer tokens from an empty account, explicit revert", async function() {
    const [owner, addr1, addr2, addr3] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    // Transfer 50 tokens from addr3 to addr2
    await expect (hardhatToken.connect(addr3).transfer(addr2.address, 50)).to.be.revertedWith("Not enough tokens");
  });

  it("Should not transfer tokens from an empty account, general revert", async function() {
    const [owner, addr1, addr2, addr3] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    // Transfer 50 tokens from addr3 to addr2
    await expect (hardhatToken.connect(addr3).transfer(addr2.address, 50)).to.be.reverted;
  });
});

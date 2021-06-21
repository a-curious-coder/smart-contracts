const { assert } = require("console");

const Voting = artifacts.require("./Voting.sol");

contract("Voting", accounts => {
  describe("Register", () => {
    it("Registers user to vote", async () => {
      // Deploys fresh voting contract
      const voting = await Voting.deployed();
      await voting.registerVoter(accounts[0]);
      // Awaits and stores value from registered
      const registeredToVote = await voting.isRegisteredToVote(accounts[0]);
      assert(true, registeredToVote, "Successfully registers to vote");
    });
  });
});

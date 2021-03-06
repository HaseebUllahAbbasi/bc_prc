pragma solidity >=0.4.21 <0.7.0;

contract Election {
    // Model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    // Store candidate
    //Read/write Candidates
    mapping(uint => Candidate) public candidates;

    // Store Cnadidates Count
    uint public candidatesCount;

   constructor () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
      addCandidate("Candidate 3");
      addCandidate("Candidate 4");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);

     }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}
}
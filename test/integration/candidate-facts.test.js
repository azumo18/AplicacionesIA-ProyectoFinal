const fs = require('fs');
const path = require('path');
const { asyncExtractAllCandidates } = require('../../public/scripts/candidate-facts');

describe('candidate-facts', () => {
    test('asyncExtractAllCandidates formats JSON correctly into Prolog facts', async () => {
        const resumesFolderPath = path.join(__dirname, 'test_cvs');

        const result = await asyncExtractAllCandidates(resumesFolderPath);

        expect(result).toContain('has_skill(sofia_castro, javascript).');
        expect(result).toContain('has_skill(elena_rojas, python).');
        expect(result).toContain('has_skill(diego_navarro, aws).');
        expect(result).toContain('has_skill(laura_brenes, flutter).');
    });
});

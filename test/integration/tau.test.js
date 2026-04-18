const path = require('path');
const { asyncTauQuery } = require('../../public/scripts/tau');
const { asyncExtractAllCandidates } = require('../../public/scripts/candidate-facts');

const TEST_VARS = {
    resumesFolderPath: path.join(__dirname, 'test_cvs'),
    prologFolderPath: path.join(__dirname, '../../prolog'),
    query: 'top_applicants_breakdown(3, TopList).',
    requiredSkills: ["javascript", "python"]
}

describe('tau.js integration tests con top_applicants_breakdown', () => {
    test('tau trae un resultado con el query top_applicants_breakdown', async () => {
        let dynamicRules = TEST_VARS.requiredSkills.map(skill => `required_skill(${skill}).`).join('\n');
        dynamicRules += await asyncExtractAllCandidates(TEST_VARS.resumesFolderPath);
        const result = await asyncTauQuery(TEST_VARS.prologFolderPath, dynamicRules, TEST_VARS.query);
        // Revisamos que la respuesta contenga un resultado válido
        expect(result.results).toBeDefined();
        expect(result.results.length).toBeGreaterThan(0);
        expect(result.results).not.toContain('error');
    });
    test('Al menos 1 candidato tiene exact_match con el query top_applicants_breakdown', async () => {
        // 1. Construimos las reglas dinámicas
        let dynamicRules = TEST_VARS.requiredSkills.map(skill => `required_skill(${skill}).`).join('\n');
        // 2. Extraemos los hechos (facts) de los candidatos llamando a asyncExtractAllCandidates
        dynamicRules += await asyncExtractAllCandidates(TEST_VARS.resumesFolderPath);

        // 3. Ejecutamos tau.js
        const result = await asyncTauQuery(TEST_VARS.prologFolderPath, dynamicRules, TEST_VARS.query);
        const first_candidate = result.results[0];
        //  TopList = [candidate(valeria_montero,50.0,[skill(javascript,no_match,no_match),skill(python,python,exact_match)]),candidate(sofia_castro,87.5,[skill(javascript,javascript,exact_match),skill(javascript,typescript,strong_partial_match),skill(python,no_match,no_match)]),candidate(roberto_jimenez,100.0,[skill(javascript,javascript,exact_match),skill(python,python,exact_match)])]

        expect(first_candidate).toContain('exact_match');
    });
});

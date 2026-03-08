const pl = require("tau-prolog");
const fs = require("fs");
const path = require("path");

const { asyncTauQuery } = require("../scripts/tau");

/**
 * Skills de hechos a reglas
 * @param {json} cv 
 * @returns 
 */
const asyncExtractCandidateFacts = async (cv) => {
  // to_atom
  const candidateId = cv.name.toLowerCase().replace(/\s+/g, '_');
  let prologFacts = `\n% --- Hechos dinámicos para ${candidateId} ---\n`;
  let queries = [];

  cv.skills.forEach(skill => {
    prologFacts += `has_skill(${candidateId}, ${skill}).\n`;
    // adicionalmente agregar consultas prolog effective_match_score(Candidate, Skill)
    queries.push(`effective_match_score(${candidateId}, ${skill}).`);
  });

  return { candidateId, prologFacts, queries };
}

/**
 * extraer por cada candidato
 * @param {string} cvsPath 
 * @returns {{candidateId: string, prologFacts: string | undefined, queries: string[] | undefined}[]} candidates
 */
const asyncExtractAllCandidates = async (cvsPath) => {
  const cvs = fs.readFileSync(cvsPath, 'utf8');
  const candidates = [];
  for (const cv of JSON.parse(cvs)) {
    const { candidateId, prologFacts, queries } = await asyncExtractCandidateFacts(cv);
    candidates.push({ candidateId, prologFacts, queries });
  }
  // validate null fields
  candidates.forEach(candidate => {
    if (!candidate.candidateId || !candidate.prologFacts || !candidate.queries) {
      throw new Error(`In asyncExtractAllCandidates: Invalid candidate ${candidate.candidateId}`);
    }
  });

  return candidates;
}

/**
 * evalua la lista de candidatos
 * @param {{candidateId: string, prologFacts: string | undefined, queries: string[] | undefined }[]} candidates
 * @returns {{candidateId: string, result: string | undefined}[]} results
 */
const asyncEvaluateCandidates = async (candidates) => {
  /*
  ToDo: falla en el path de prolog, adentro de asyncTauQuery

  const results = [];
  for (const candidate of candidates) {
    const { candidateId, prologFacts, queries } = candidate;

    for (const query of queries) {
      const result = await asyncTauQuery(path.join(__dirname, '..', 'prolog'), prologFacts, query);
      //console.log("resullltt ", result)
      results.push({ candidateId, query, result });
    }
  }
  return results;
  */
}

module.exports = { asyncExtractAllCandidates }; //asyncEvaluateCandidates

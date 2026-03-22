
const fs = require("fs");

/**
 * Skills de hechos a reglas
 * @param {json} cv 
 * @returns {string} candidateFacts
 */
const cvJsonToFacts = async (cv) => {
  // Suponiendo que se procesan los datos para no tener letras fuera del alfabeto ingles. **
  if(!cv.name || !cv.skills) {
    console.error("The fields 'name' and 'skills' are mandatory for each cv in json.");
  }
  // `\n% --- Hechos dinamicos para cv de: ${candidateName} ---\n`;
  const candidateName = cv.name.toLowerCase().replace(/\s+/g, '_'); // Force prolog atom
  return cv.skills.map(skill => 
    `\nhas_skill(${candidateName}, ${skill}).`
  ).join('');
}

/**
 * extraer por cada candidato
 * @param {string} cvsPath 
 * @returns {candidateFacts: string} candidates
 */
const asyncExtractAllCandidates = async (cvsPath) => {
  let cvs = await fs.readFileSync(cvsPath, 'utf8');
  let allCandidateSkills = "";

  for (const cv of JSON.parse(cvs)) {
    allCandidateSkills += await cvJsonToFacts(cv);
  }

  return allCandidateSkills;
}

module.exports = { asyncExtractAllCandidates };

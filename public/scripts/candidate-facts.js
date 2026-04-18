
const fs = require("fs");
const path = require("path");

/**
 * Skills de hechos a reglas
 * @param {json} cv 
 * @returns {string} candidateFacts
 */
const cvJsonToFacts = async (cv) => {
  // Suponiendo que se procesan los datos para no tener letras fuera del alfabeto ingles. **
  if (!cv.name || !cv.skills) {
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
 * @param {string} folderPath 
 * @returns {candidateFacts: string} candidates
 */
const asyncExtractAllCandidates = async (folderPath) => {
  let allCandidateSkills = "";

  const files = fs.readdirSync(folderPath);
  for (const file of files) {
    if (file.endsWith('.json')) {
      const filePath = path.join(folderPath, file);
      const cvs = fs.readFileSync(filePath, 'utf8');
      for (const cv of JSON.parse(cvs)) {
        allCandidateSkills += await cvJsonToFacts(cv);
      }
    }
  }

  return allCandidateSkills;
}

module.exports = { asyncExtractAllCandidates };

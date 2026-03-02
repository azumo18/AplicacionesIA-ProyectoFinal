const pl = require("tau-prolog");
require("tau-prolog/modules/promises.js")(pl);

const fs = require('fs');
const path = require('path');

const getPrologFiles = (folderPath) => {
  const files = fs.readdirSync(folderPath);
  const plFiles = files.filter(file => path.extname(file) === '.pl');
  return plFiles.map(file => path.join(folderPath, file));
};

const getPrologFilesContent = (prologFiles) => {
  return prologFiles.map(file => fs.readFileSync(file, 'utf8'));
};

const asyncTauQuery = async(staticRulesFolderPath, dynamicRules, query) => {
    const session = pl.create();

    const staticRulesFiles = getPrologFiles(staticRulesFolderPath);
    const staticRules = getPrologFilesContent(staticRulesFiles);
    for(const ruleSet of staticRules) await session.promiseConsult(ruleSet);
    
    await session.promiseConsult(dynamicRules);
    await session.promiseQuery(query);

    const results = [];
    for await (let answer of session.promiseAnswers())
      results.push(session.format_answer(answer));

    return {
      staticRules,
      dynamicRules,
      query,
      results
    };
};

module.exports = { asyncTauQuery };
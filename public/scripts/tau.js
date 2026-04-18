const pl = require("tau-prolog");
require("tau-prolog/modules/promises.js")(pl);
require("tau-prolog/modules/lists.js")(pl);

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

const asyncTauQuery = async (staticRulesFolderPath, dynamicRules, query) => {
  const session = pl.create();

  await session.promiseConsult(":- use_module(library(lists)).");
  const staticRulesFiles = getPrologFiles(staticRulesFolderPath);
  const staticRules = getPrologFilesContent(staticRulesFiles);
  for (const ruleSet of staticRules) await session.promiseConsult(ruleSet);

  const results = [];
  try {
    await session.promiseConsult(dynamicRules);
    await session.promiseQuery(query);

    for await (let answer of session.promiseAnswers())
      results.push(session.format_answer(answer));

  } catch (error) {
    if (error.ref === 225735 || error.ref === 225736) {
      console.error("Prolog Error: Should only english characters.");
    }

    if (error.id === 'throw') {
      const errorTerm = error.args[0]; // the error/2 term
      const errorType = errorTerm.args[0].id; // e.g. existence_error
      const errorDetails = errorTerm.args[0].args; // details array

      const kind = errorDetails[0].id; // 'procedure'
      const predName = errorDetails[1].args[0].id; // e.g. 'top_applicants'
      const predArity = errorDetails[1].args[1].value; // e.g. '2'

      const finalDisplay = `Prolog error: ${errorType}(${kind}, ${predName}/${predArity})`;
      console.error(finalDisplay);
      results.push(finalDisplay);
    }
  }

  return {
    staticRules,
    dynamicRules,
    query,
    results
  };
};

module.exports = { asyncTauQuery };
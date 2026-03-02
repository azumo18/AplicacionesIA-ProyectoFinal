const pl = require("tau-prolog");
require("tau-prolog/modules/promises.js")(pl);

//probablemente las vamos a terminar leyendo de un archivo aparte
const staticRules = `
  ancestor(X, Y) :- parent(X, Y).
  ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
`;

const asyncTauQuery = async(dynamicRules, query) => {
    const session = pl.create();
    await session.promiseConsult(staticRules);
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
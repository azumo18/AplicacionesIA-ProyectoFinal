window.addEventListener('load', () => {
    document.querySelector('#dynamicRulesContainer').value = `parent(john, mary).\nparent(mary, susan).`;
    document.querySelector('#queryContainer').value = `ancestor(john, susan).`;
    document.querySelector('#promptContainer').value = `tell me a joke`;
});
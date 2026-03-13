window.addEventListener('load', () => {
    document.querySelector('#dynamicRulesContainer').value = 
        `required_skill(javascript).\nrequired_skill(html).\nrequired_skill(css).\nrequired_skill(sql).\nrequired_skill(cpp).`;
    document.querySelector('#queryContainer').value = `top_applicants_percent(3, TopList).`;
    document.querySelector('#promptContainer').value = `tell me a joke`;
});
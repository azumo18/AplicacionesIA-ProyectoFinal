
let ITCategories = undefined;
let selectedITCategories = { tabs: [] };

window.addEventListener('load', async () => {
    const response = await fetch('/categories', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });

    const data = await response.json();
    ITCategories = JSON.parse(data);
    console.log('IT Categories', ITCategories);

    const html = ITCategories.tabs.map((tab, tabIndex) => {
        tab.index = tabIndex;
        return `
            <div class="card">
                <div class="card-header d-grid">
                    <a class="btn btn-sm btn-block collapsed" data-bs-toggle="collapse" href="#collapse_${tabIndex}">
                        ${tab.title}
                    </a>
                </div>
                <div id="collapse_${tabIndex}" class="collapse" data-bs-parent="#categoryAccordion">
                    <div class="card-body">
                        <dl>
                            ${tab.categories.map((category, categoryIndex) => {
                                category.index = categoryIndex;
                                return `
                                    <dt style="font-weight:bold;">${category.title}</dt>
                                    ${category.elements.map((element, elementIndex) => {
                                        element.index = elementIndex;
                                        return `
                                            <div class="conceptContainer">
                                                <input class="form-check-input" type="checkbox" id="concept_${tabIndex}_${categoryIndex}_${elementIndex}">
                                                <dd>${formatConcept(element)}</dd>
                                            </div>`;
                                    }).join('')}`;
                            }).join('')}
                        </dl>
                    </div>
                </div>
            </div>`;
    }).join('');

    document.querySelector('#categoryAccordion').innerHTML = html;
    [...document.querySelectorAll('.conceptContainer > .form-check-input')].forEach(e => e.addEventListener('change', checkboxClick));

    document.querySelector('#searchInput').addEventListener('input', search);
});

const search = (event) => {
    const query = event.target.value.toLowerCase();
    const hintBox = document.querySelector('#hintBox');
    hintBox.innerHTML = '';

    if (!query) {
        hintBox.style.display = 'none';
        return;
    }

    const deepCopy = JSON.parse(JSON.stringify(ITCategories.tabs));
    const matches = deepCopy.filter(tab => {
        const matchingCategories = tab.categories.filter(category => {
            const matchingElements = category.elements.filter(element => {
                const matchingNames = [element.name, ...element.aliases].filter(name => name.replaceAll('_', ' ').includes(query));
                if(matchingNames.length > 0) element.match = matchingNames[0];
                return matchingNames.length > 0;
            });
            category.elements = matchingElements;
            return matchingElements.length > 0;
        });
        tab.categories = matchingCategories;
        return matchingCategories.length > 0;
    });

    if (matches.length > 0) {
        matches.forEach(tab => {
            tab.categories.forEach(category => {
                category.elements.forEach(element => {
                    const div = document.createElement('div');
                    div.textContent = `${tab.title} ${category.title != '' ? `> ${category.title}` : ''}> ${formatConcept(element)}`;
                    div.onclick = () => {
                        hintBoxClick(tab.index, category.index, element.index);
                        hintBox.style.display = 'none';
                    };
                    hintBox.appendChild(div);
                });
            });
        });
        hintBox.style.display = 'block';
    } else {
        hintBox.style.display = 'none';
    }
}

const formatConcept = (element) => {
    let display = element.name;

    if(element.mergedDisplay && element.aliases.length > 0)
        display = `${element.name} (${element.aliases[0]})`
    else if(element.aliases.length > 0 && !element.preventAliasDisplay)
        display = element.aliases[0];

    if(element.match && !display.includes(element.match)) display += ` (${element.match})`;

    return display.replaceAll('_', ' ');
}

const hintBoxClick = (tabIndex, categoryIndex, elementIndex) => {
    const tab = document.querySelector(`a[href="#collapse_${tabIndex}"]`);
    if(tab && tab.classList.contains('collapsed')) tab.click();

    const concept = document.querySelector(`#concept_${tabIndex}_${categoryIndex}_${elementIndex}`);
    if(concept) {
        concept.scrollIntoView();
        concept.focus();
    }
};

const checkboxClick = (event) => {
    const splitSelectedItemID = event.target.id.split('_');
    const selectedItemIndexes = {
        tabIndex: parseInt(splitSelectedItemID[1]),
        categoryIndex: parseInt(splitSelectedItemID[2]),
        elementIndex: parseInt(splitSelectedItemID[3])
    };

    const fullTab = ITCategories.tabs.find(tab => tab.index === selectedItemIndexes.tabIndex);
    const fullCategory = fullTab.categories.find(category => category.index === selectedItemIndexes.categoryIndex);
    const fullElement = fullCategory.elements.find(element => element.index === selectedItemIndexes.elementIndex);

    if(event.target.checked === true){
        let tab = selectedITCategories.tabs.find(tab => tab.index === selectedItemIndexes.tabIndex);
        if(!tab) selectedITCategories.tabs.push({ 
            index: fullTab.index, 
            title: fullTab.title,
            categories: [], 
        });
        tab = selectedITCategories.tabs.find(tab => tab.index === selectedItemIndexes.tabIndex);

        let category = tab.categories.find(category => category.index === selectedItemIndexes.categoryIndex);
        if(!category) tab.categories.push({
            index: fullCategory.index,
            title: fullCategory.title,
            elements: [],
        });
        category = tab.categories.find(category => category.index === selectedItemIndexes.categoryIndex);

        category.elements.push({...fullElement});
    }else{
        let tab = selectedITCategories.tabs.find(tab => tab.index === selectedItemIndexes.tabIndex);
        let category = tab.categories.find(category => category.index === selectedItemIndexes.categoryIndex);

        category.elements = category.elements.filter(element => element.index != selectedItemIndexes.elementIndex);
        tab.categories = tab.categories.filter(category => category.elements.length > 0);
        selectedITCategories.tabs = selectedITCategories.tabs.filter(tab => tab.categories.length > 0);
    }

    document.querySelector('#summaryContainer').value = selectedITCategories.tabs.map(tab => {
        return `${tab.title}\n${tab.categories.map(category => {
            return ` • ${category.title}\n${category.elements.map(element => {
                return `     - ${formatConcept(element)}\n`
            }).join('')}`
        }).join('')}`
    }).join('');
};
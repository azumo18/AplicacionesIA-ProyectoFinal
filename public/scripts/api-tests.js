window.addEventListener('load', () => {
    document.querySelector('#postQueryButton').addEventListener('click', async () => {
        let dynamicRules = document.querySelector('#dynamicRulesContainer').value;
        const query = document.querySelector('#queryContainer').value;

        //#region Load candidates
        const candidates = await fetch('/extract-candidates', {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        });
        dynamicRules += await candidates.json();
        //#endregion

        const body = {
            dynamicRules,
            query
        };

        console.log(`API Call's Body`, body);

        const response = await fetch('/query', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });

        const data = await response.json();
        console.log('API Response', data);

        document.querySelector('#resultsContainer').value = data.results.join('\n');
    });

    document.querySelector('#postPromptButton').addEventListener('click', async () => {
        const prompt = document.querySelector('#promptContainer').value;

        const response = await fetch("http://localhost:11434/api/generate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                model: "deepseek-r1:1.5b",
                prompt: prompt
            })
        });

        const reader = response.body.getReader();
        const decoder = new TextDecoder();
        let output = "";

        while (true) {
            const { done, value } = await reader.read();
            if (done) break;

            const chunk = decoder.decode(value, { stream: true });
            try {
                const parsed = JSON.parse(chunk);
                output += parsed.response;
                document.querySelector('#resultsContainer2').value = output;
            } catch (err) {
                console.error("Failed to parse chunk:", chunk);
            }
        }
    });

    // un boton que llame a la api candidates y 
    // evalua cada candidato de la lista de candidatos
    document.querySelector('#postCandidateFactsButton').addEventListener('click', async () => {
        const candidates = await fetch('/extract-candidates', {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        });
        const result = await candidates.json();
        alert(result);
    });
});
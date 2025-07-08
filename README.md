# Robot Framework com Cucumber - Ecommerce Playground

Projeto de automação frontend usando Robot Framework com estrutura para testes baseados em cenários Gherkin (.feature).

## Como usar

1. Crie e ative seu ambiente virtual Python (recomendado):

```bash
python -m venv venv
source venv/bin/activate   # Linux/Mac
venv\Scripts\activate    # Windows PowerShell
```

2. Instale as dependências:

```bash
pip install -r requirements.txt
```

3. Rode os testes:

```bash
robot features/steps.robot
```

## Estrutura do projeto

- `features/`: arquivo .feature e implementação dos steps em Robot
- `resources/pages/`: keywords por página
- `resources/keywords.robot`: keywords genéricas
- `variables/variables.robot`: variáveis e dados de teste
- `requirements.txt`: dependências Python

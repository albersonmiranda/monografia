# Ensaios sobre Escolaridade e Reprodução Social

Este repositório contém o texto e código de minha monografia, intitulada "Ensaios sobre Escolaridade e Reprodução Social", apresentada ao Instituto Federal do Espírito Santo (IFES).

## Estrutura do Repositório

A estrutura do repositório é a seguinte:

📦monografia \
 ┣ 📂config \
 ┃ ┣ 📂beamer \
 ┃ ┃ ┣ 📜backmatter.tex \
 ┃ ┃ ┣ 📜ppgeco.sty \
 ┃ ┃ ┗ 📜preamble.tex \
 ┃ ┣ 📂elementos \
 ┃ ┃ ┣ 📂pos_textuais \
 ┃ ┃ ┃ ┣ 📜apendice.tex \
 ┃ ┃ ┃ ┗ 📜pos_textuais.tex \
 ┃ ┃ ┣ 📂pre_textuais \
 ┃ ┃ ┃ ┣ 📜pre_textuais.tex \
 ┃ ┃ ┃ ┣ 📜resumo.tex \
 ┃ ┃ ┃ ┣ 📜siglas.tex \
 ┃ ┃ ┃ ┗ 📜simbolos.tex \
 ┃ ┃ ┣ 📜monografia.bib \
 ┃ ┃ ┣ 📜packages.bib \
 ┃ ┃ ┗ 📜preamble.tex \
 ┃ ┣ 📂tema \
 ┃ ┃ ┣ 📜customizacao.tex \
 ┃ ┃ ┗ 📜ifestex.cls \
 ┣ 📂data \
 ┃ ┗ 📜rais.rds \
 ┣ 📂data-raw \
 ┃ ┗ 📜rais.R \
 ┣ 📂img \
 ┣ 📂render \
 ┃ ┣ 📜apresentacao.pdf \
 ┃ ┗ 📜monografia.pdf \
 ┣ 📜.gitignore \
 ┣ 📜.lintr \
 ┣ 📜_quarto.yml \
 ┣ 📜apresentacao.qmd \
 ┗ 📜monografia.qmd

## Arquivos Principais

- **monografia.qmd**: Documento principal da monografia.
- **apresentacao.qmd**: Slides da apresentação da monografia.
- **_quarto.yml**: Configurações do projeto Quarto.
- **config/**: Contém arquivos de configuração, bibliografia e elementos pré e pós-textuais.
- **data/**: Contém os dados utilizados na análise.
- **data-raw/**: Scripts para preparação dos dados.
- **img/**: Imagens utilizadas no documento e na apresentação.

## Como Compilar

### Pré-requisitos

- [Quarto](https://quarto.org/)
- [R](https://www.r-project.org/)

### Passos

1. Clone o repositório:
    ```sh
    git clone https://github.com/albersonmiranda/monografia.git
    cd monografia
    ```

2. Instale as dependências do R:
    ```r
    install.packages(c("dplyr", "ggplot2", "kableExtra", "broom", "sandwich", "lmtest", "basedosdados"))
    ```

3. Compile a monografia:
    ```sh
    quarto render monografia.qmd
    ```

4. Compile a apresentação:
    ```sh
    quarto render apresentacao.qmd
    ```

## Contato

Para mais informações, me envie um e-mail em [albersonmiranda@hotmail.com](mailto:albersonmiranda@hotmail.com).

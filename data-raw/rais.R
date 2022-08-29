## code to prepare `rais` dataset

# pacotes
library(magrittr, include.only = "%>%")

# set Google BigQuery project
basedosdados::set_billing_id("monografia-359922")

# importando dados da Rais
rais = basedosdados::bdplyr("br_me_rais.microdados_vinculos") %>%
    # filtrando dados
    dplyr::filter(
        # Espírito Santo
        sigla_uf == "ES" &
        # maiores de 18 anos
        idade >= 18 &
        # sem vazios em remuneração
        !is.na(valor_remuneracao_media) &
        # sem vazios em raça/cor
        !is.na(raca_cor) & raca_cor != "9" &
        # sem vazios em sexo
        !is.na(sexo) &
        # valores positivos para remuneração
        valor_remuneracao_media > 0
    ) %>%
    # definindo grau de instrução
    dplyr::mutate(
        grau_instrucao = ifelse(ano <= 2005, grau_instrucao_1985_2005, grau_instrucao_apos_2005)
    ) %>%
    # escolhendo colunas
    dplyr::select(
        ano,
        id_municipio,
        sexo,
        raca_cor,
        valor_remuneracao_media,
        idade,
        grau_instrucao) %>%
    # grau de instrução preenchido
    dplyr::filter(!is.na(grau_instrucao)) %>%
    # coletando dados
    basedosdados::bd_collect()

# dicionário Rais
rais = within(rais, {
    grau_instrucao = ifelse(grau_instrucao == "1", "analfabeto", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "2", "fund_I_incompleto", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "3", "fund_I_completo", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "4", "fund_II_incompleto", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "5", "fund_II_completo", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "6", "medio_incompleto", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "7", "medio_completo", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "8", "superior_incompleto", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "9", "superior_completo", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "10", "mestrado", grau_instrucao)
    grau_instrucao = ifelse(grau_instrucao == "11", "doutorado", grau_instrucao)
    grau = grau_instrucao
    grau_instrucao = NULL
    sexo = ifelse(sexo == "1", "masculino", sexo)
    sexo = ifelse(sexo == "2", "feminino", sexo)
    raca_cor = ifelse(raca_cor == "1", "indigena", raca_cor)
    raca_cor = ifelse(raca_cor == "2", "branca", raca_cor)
    raca_cor = ifelse(raca_cor == "4", "preta", raca_cor)
    raca_cor = ifelse(raca_cor == "6", "amarela", raca_cor)
    raca_cor = ifelse(raca_cor == "8", "parda", raca_cor)
    raca_cor = ifelse(raca_cor == "9", "nao_informado", raca_cor)
    sexo = relevel(as.factor(sexo), "masculino")
    raca_cor = relevel(as.factor(raca_cor), "branca")
})

# municípios de Vitória, Vila Velha, Serra e Cariacica
grande_vitoria = c("3205309", "3205200", "3205002", "3201308")

# deflacionando
ipca = rbcb::get_series(
    c(ipca = 433),
    start_date = "2006-01-01"
)

# salvando dataframe
saveRDS(rais, "data/rais.RDS", compress = FALSE)

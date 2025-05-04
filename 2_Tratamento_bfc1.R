# Tratamento de dados

#Converter as tipagens
bfc1 <- base_final2
bfc1 <- bfc1 %>%
  mutate(
    NU_ANO = factor(NU_ANO, levels = c(2012, 2015, 2018, 2022)),
    NU_IDADE = as.numeric(NU_IDADE),
    TP_SEXO = factor(TP_SEXO, levels = c("M", "F"))
  ) %>%
  drop_na(NU_ANO, NU_IDADE, TP_SEXO)

#Converter CO_GRUPO
sort(unique(bfc1$CO_GRUPO))
# Copia e cola do dicionário de variáveis de um dos anos
#Peguei o de 2022 e não tinha a cat.26

# Criar o vetor com todos os nomes dos grupos
grupos_nomes <- c(
  "1" = "Administração",
  "2" = "Direito",
  "13" = "Ciências Econômicas",
  "18" = "Psicologia",
  "22" = "Ciências Contábeis",
  "26" = "Design", #aparece no de 2012
  "29" = "Turismo",
  "38" = "Serviço Social",
  "67" = "Secretariado Executivo",
  "81" = "Relações Internacionais",
  "83" = "Tecnologia em Design de Moda",
  "84" = "Tecnologia em Marketing",
  "85" = "Tecnologia em Processos Gerenciais",
  "86" = "Tecnologia em Gestão de Recursos Humanos",
  "87" = "Tecnologia em Gestão Financeira",
  "88" = "Tecnologia em Gastronomia",
  "93" = "Tecnologia em Gestão Comercial",
  "94" = "Tecnologia em Logística",
  "100" = "Administração Pública",
  "101" = "Teologia",
  "102" = "Tecnologia em Comércio Exterior",
  "103" = "Tecnologia em Design de Interiores",
  "104" = "Tecnologia em Design Gráfico",
  "105" = "Tecnologia em Gestão da Qualidade",
  "106" = "Tecnologia em Gestão Pública",
  "803" = "Jornalismo",
  "804" = "Publicidade e Propaganda"
)

# Adicionar a variável com os nomes ao dataframe
bfc1 <- bfc1 %>%
  mutate(
    CO_GRUPO_NOME = factor(CO_GRUPO,
                           levels = names(grupos_nomes),
                           labels = grupos_nomes)
  )
# Verificação
table(bfc1$CO_GRUPO_NOME, useNA = "always")

# Converter raça e criar var. dicotômica de raça
bfc1 <- bfc1 %>%
  mutate(
    # 1. Converter QE_I02 para fator com categorias nomeadas
    QE_I02 = factor(QE_I02,
                    levels = c("A", "B", "C", "D", "E", "F"),
                    labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena", "Não quero declarar")),
    
    # 2. Criar variável binária (0/1) para raça
    raca_binaria = factor(ifelse(QE_I02 %in% c("Preta", "Parda", "Indígena"), 1, 0),
                          levels = c(0, 1),
                          labels = c("Outros", "Direito à cota racial"))
  )
  

# Verificar os resultados
table(bfc1$QE_I02, useNA = "always")
table(bfc1$raca_binaria, useNA = "always")

# Factor para demais variáveis
bfc1 <- bfc1 %>%
  mutate(
    # QE_I08 - Renda familiar (mantido do código anterior)
    QE_I08 = factor(QE_I08,
                    levels = c("A", "B", "C", "D", "E", "F", "G"),
                    labels = c("Até 1,5 SM (até R$ 1.818)",
                               "1,5 a 3 SM (R$ 1.818,01 a R$ 3.636)",
                               "3 a 4,5 SM (R$ 3.636,01 a R$ 5.454)",
                               "4,5 a 6 SM (R$ 5.454,01 a R$ 7.272)",
                               "6 a 10 SM (R$ 7.272,01 a R$ 12.120)",
                               "10 a 30 SM (R$ 12.120,01 a R$ 36.360)",
                               "Acima de 30 SM (mais de R$ 36.360)")),
    
    # QE_I09 - Situação financeira (mantido)
    QE_I09 = factor(QE_I09,
                    levels = c("A", "B", "C", "D", "E", "F"),
                    labels = c("Sem renda, custeado por programas gov.",
                               "Sem renda, custeado pela família",
                               "Com renda + ajuda familiar",
                               "Com renda, sem ajuda",
                               "Com renda, ajuda família",
                               "Principal responsável pelo sustento")),
    
    # QE_I10 - Situação de trabalho (mantido)
    QE_I10 = factor(QE_I10,
                    levels = c("A", "B", "C", "D", "E"),
                    labels = c("Não trabalha",
                               "Trabalho eventual",
                               "Até 20h/semana",
                               "21 a 39h/semana",
                               "40h ou mais/semana")),
    
    # QE_I11 - Tipo de bolsa/financiamento (mantido)
    QE_I11 = factor(QE_I11,
                    levels = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"),
                    labels = c("Curso gratuito",
                               "Nenhum, curso pago",
                               "ProUni integral",
                               "ProUni parcial",
                               "FIES",
                               "ProUni parcial + FIES",
                               "Bolsa gov. estadual/municipal",
                               "Bolsa da instituição",
                               "Bolsa outra entidade",
                               "Financ. da instituição",
                               "Financ. bancário")),
    
    # QE_I15 - Ação afirmativa (NOVO)
    QE_I15 = factor(QE_I15,
                    levels = c("A", "B", "C", "D", "E", "F"),
                    labels = c("Não ingressou por ação afirmativa",
                               "Sim, critério étnico-racial",
                               "Sim, critério de renda",
                               "Sim, escola pública/bolsa escola",
                               "Sim, combinação de critérios",
                               "Sim, outro critério diferente")),
    
    # QE_I23 - Horas de estudo (NOVO)
    QE_I23 = factor(QE_I23,
                    levels = c("A", "B", "C", "D", "E"),
                    labels = c("Nenhuma, só aulas",
                               "1 a 3 horas/semana",
                               "4 a 7 horas/semana",
                               "8 a 12 horas/semana",
                               "Mais de 12 horas/semana"))
  )

# Verificar as novas variáveis
table(bfc1$QE_I15, useNA = "always")
table(bfc1$QE_I23, useNA = "always")

#Cria variável de cotas (Os NAs estão no grupo Não)
bfc1 <- bfc1 %>%
  mutate(
    cotas = factor(
      ifelse(is.na(QE_I15) | QE_I15 == "Não ingressou por ação afirmativa", 0, 1),
      levels = c(0, 1),
      labels = c("Não", "Sim")
    )
  )
# Verificação
table(bfc1$cotas, useNA = "always")
table(bfc1$QE_I15, bfc1$cotas, useNA = "always")

#Criar variável de cota racial
bfc1 <- bfc1 %>%
  mutate(
    cota_racial = factor(
      ifelse(raca_binaria == "Direito à cota racial" & cotas == "Sim", 1, 0),
      levels = c(0, 1),
      labels = c("Não", "Sim")
    )
  )

# Verificação:
table(bfc3$cota_racial, useNA = "always")

# Verificar os resultados
glimpse(bfc1)

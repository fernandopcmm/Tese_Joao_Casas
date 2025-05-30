library(tidyverse)

#########################################
### Importação e unificação das bases ###
#########################################

#Caminho: /Users/fernandolhamas/Documents/Tese_Joao_Casas

#Padronizar base de 2012 com as demais
microdados2012_arq11 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq11.txt", sep=";")
microdados2012_arq14 <- microdados2012_arq11 %>% rename(QE_I08 = QE_I05)
readr::write_delim(microdados2012_arq14,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq14.txt",delim = ";")

microdados2012_arq12 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq12.txt", sep=";")
microdados2012_arq15 <- microdados2012_arq12 %>% rename(QE_I09 = QE_I06)
readr::write_delim(microdados2012_arq15,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq15.txt",delim = ";")

microdados2012_arq16_2 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq16_2.txt", sep=";")
microdados2012_arq17 <- microdados2012_arq16_2 %>% rename(QE_I11 = QE_I10)
readr::write_delim(microdados2012_arq17,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq17.txt",delim = ";")

microdados2012_arq13 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq13.txt", sep=";")
microdados2012_arq16 <- microdados2012_arq13 %>% rename(QE_I10 = QE_I07)
readr::write_delim(microdados2012_arq16,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq16.txt",delim = ";")

microdados2012_arq18 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq18.txt", sep=";")
microdados2012_arq21 <- microdados2012_arq18 %>% rename(QE_I15 = QE_I12)
readr::write_delim(microdados2012_arq21,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq21.txt",delim = ";")

microdados2012_arq26 <- read.csv("~/Documents/Tese_Joao_Casas/C1/microdados2012_arq26.txt", sep=";")
microdados2012_arq29 <- microdados2012_arq26 %>% rename(QE_I23 = QE_I20)
readr::write_delim(microdados2012_arq29,"/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/microdados2012_arq29.txt",delim = ";")

#Lista de arquivos

caminho_arquivos = "/Users/fernandolhamas/Documents/Tese_Joao_Casas/C1/"

lista_arquivos1 = c(paste(caminho_arquivos,"microdados2012_arq1.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq1.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq1.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq1.txt", sep = ""))
lista_arquivos3 = c(paste(caminho_arquivos,"microdados2012_arq3.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq3.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq3.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq3.txt", sep = ""))
lista_arquivos5 = c(paste(caminho_arquivos,"microdados2012_arq5.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq5.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq5.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq5.txt", sep = ""))
lista_arquivos6 = c(paste(caminho_arquivos,"microdados2012_arq6.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq6.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq6.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq6.txt", sep = ""))
lista_arquivos8 = c(paste(caminho_arquivos,"microdados2012_arq8.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq8.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq8.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq8.txt", sep = ""))
lista_arquivos14 = c(paste(caminho_arquivos,"microdados2012_arq14.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq14.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq14.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq14.txt", sep = ""))
lista_arquivos15 = c(paste(caminho_arquivos,"microdados2012_arq15.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq15.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq15.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq15.txt", sep = ""))
lista_arquivos16 = c(paste(caminho_arquivos,"microdados2012_arq16.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq16.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq16.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq16.txt", sep = ""))
lista_arquivos17 = c(paste(caminho_arquivos,"microdados2012_arq17.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq17.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq17.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq17.txt", sep = ""))
lista_arquivos21 = c(paste(caminho_arquivos,"microdados2012_arq21.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq21.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq21.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq21.txt", sep = ""))
lista_arquivos29 = c(paste(caminho_arquivos,"microdados2012_arq29.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2015_arq29.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2018_arq29.txt", sep = ""),
                    paste(caminho_arquivos,"microdados2022_arq29.txt", sep = ""))

# Criar base vazia para receber os dados
bd = data.frame()

# Loop para pegar todos os dados
for (i in 1:length(lista_arquivos1)) 
  {
  
    microdados1 <- read.csv(lista_arquivos1[i], colClasses=c('character'),sep=";")
    microdados3 <- read.csv(lista_arquivos3[i], colClasses=c('character'),sep=";")
    microdados5 <- read.csv(lista_arquivos5[i], colClasses=c('character'),sep=";")
    microdados6 <- read.csv(lista_arquivos6[i], colClasses=c('character'),sep=";")
    microdados8 <- read.csv(lista_arquivos8[i], colClasses=c('character'),sep=";")
    microdados14 <- read.csv(lista_arquivos14[i], colClasses=c('character'),sep=";")
    microdados15 <- read.csv(lista_arquivos15[i], colClasses=c('character'),sep=";")
    microdados16 <- read.csv(lista_arquivos16[i], colClasses=c('character'),sep=";")
    microdados17 <- read.csv(lista_arquivos17[i], colClasses=c('character'),sep=";")
    microdados21 <- read.csv(lista_arquivos21[i], colClasses=c('character'),sep=";")
    microdados29 <- read.csv(lista_arquivos29[i], colClasses=c('character'),sep=";")
    
    #Selecionar as colunas de interesse
    microdados_1 = microdados1 %>% select(NU_ANO, CO_CURSO, CO_GRUPO) %>% mutate(across(everything(), as.numeric)) 
    microdados_3 = microdados3 %>% select(CO_CURSO, NT_GER, DS_VT_ACE_OCE) %>% mutate(CO_CURSO = as.numeric(CO_CURSO), NT_GER = as.numeric(NT_GER))
    microdados_5 = microdados5 %>% select(CO_CURSO,TP_SEXO) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_6 = microdados6 %>% select(CO_CURSO,NU_IDADE) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_8 = microdados8 %>% select(CO_CURSO,QE_I02) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_14 = microdados14 %>% select(CO_CURSO,QE_I08) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_15 = microdados15 %>% select(CO_CURSO,QE_I09) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_16 = microdados16 %>% select(CO_CURSO,QE_I10) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_17 = microdados17 %>% select(CO_CURSO,QE_I11) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_21 = microdados21 %>% select(CO_CURSO,QE_I15) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    microdados_29 = microdados29 %>% select(CO_CURSO,QE_I23) %>% mutate(CO_CURSO = as.numeric(CO_CURSO))
    
    bd_aux <- cbind(
      microdados_1,
      microdados_3,
      microdados_5,
      microdados_6,
      microdados_8,
      microdados_14,
      microdados_15,
      microdados_16,
      microdados_17,
      microdados_21,
      microdados_29
    )
    
    # Adicionar à base final    
    bd <- rbind(bd, bd_aux) 
    }
set.seed(123) # Para reprodutibilidade

base_final <- bd %>%
  
  # Seleção inicial mantendo sua estrutura original
  select(CO_CURSO, CO_GRUPO) %>%
  
  # Joins com amostragem aleatória
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>% #núm. aleatório para linha
      arrange(CO_CURSO, random_sort) %>% #ordena por curso e depois aleatório
      distinct(CO_CURSO, .keep_all = TRUE) %>% #uma linha por curso
      select(CO_CURSO, NU_ANO),
    by = "CO_CURSO"
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.1, random_sort) %>%
      distinct(CO_CURSO.1, .keep_all = TRUE) %>%
      select(CO_CURSO.1, NT_GER),
    by = c("CO_CURSO" = "CO_CURSO.1")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.2, random_sort) %>%
      distinct(CO_CURSO.2, .keep_all = TRUE) %>%
      select(CO_CURSO.2, TP_SEXO),
    by = c("CO_CURSO" = "CO_CURSO.2")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.3, random_sort) %>%
      distinct(CO_CURSO.3, .keep_all = TRUE) %>%
      select(CO_CURSO.3, NU_IDADE),
    by = c("CO_CURSO" = "CO_CURSO.3")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.4, random_sort) %>%
      distinct(CO_CURSO.4, .keep_all = TRUE) %>%
      select(CO_CURSO.4, QE_I02),
    by = c("CO_CURSO" = "CO_CURSO.4")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.5, random_sort) %>%
      distinct(CO_CURSO.5, .keep_all = TRUE) %>%
      select(CO_CURSO.5, QE_I08),
    by = c("CO_CURSO" = "CO_CURSO.5")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.6, random_sort) %>%
      distinct(CO_CURSO.6, .keep_all = TRUE) %>%
      select(CO_CURSO.6, QE_I09),
    by = c("CO_CURSO" = "CO_CURSO.6")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.7, random_sort) %>%
      distinct(CO_CURSO.7, .keep_all = TRUE) %>%
      select(CO_CURSO.7, QE_I10),
    by = c("CO_CURSO" = "CO_CURSO.7")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.8, random_sort) %>%
      distinct(CO_CURSO.8, .keep_all = TRUE) %>%
      select(CO_CURSO.8, QE_I11),
    by = c("CO_CURSO" = "CO_CURSO.8")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.9, random_sort) %>%
      distinct(CO_CURSO.9, .keep_all = TRUE) %>%
      select(CO_CURSO.9, QE_I15),
    by = c("CO_CURSO" = "CO_CURSO.9")
  ) %>%
  left_join(
    bd %>%
      mutate(random_sort = runif(n())) %>%
      arrange(CO_CURSO.10, random_sort) %>%
      distinct(CO_CURSO.10, .keep_all = TRUE) %>%
      select(CO_CURSO.10, QE_I23),
    by = c("CO_CURSO" = "CO_CURSO.10")
  )

# Verificação final
list(
  Proporção_Original = prop.table(table(bd$TP_SEXO)),
  Proporção_Final = prop.table(table(base_final$TP_SEXO))
)
list(
  Proporção_Original = prop.table(table(bd$QE_I15)),
  Proporção_Final = prop.table(table(base_final$QE_I15))
)
list(
  Proporção_Original = prop.table(table(bd$NU_ANO)),
  Proporção_Final = prop.table(table(base_final$NU_ANO))
)
list(
  Proporção_Original = prop.table(table(bd$CO_GRUPO)),
  Proporção_Final = prop.table(table(base_final$CO_GRUPO))
)

# Remover duplicados
base_final2 <- base_final %>%
distinct(CO_CURSO, .keep_all = TRUE)

list(
  Proporção_Original = prop.table(table(bd$NU_ANO)),
  Proporção_Final = prop.table(table(base_final2$NU_ANO))
)

# Exportar base consolidada para csv (apenas se necessário)
write.csv2(base_final2, file = "/Users/fernandolhamas/Documents/Tese_Joao_Casas/bfc1.csv", row.names=F)

#Utilizamos NT_GER apenas, mas se quiser usar acertos na parte específica da prova
#Adicione com left join, depois cria um vetor do número de acertos
# Separar a coluna com o vetor de respostas (DS_VT_ACE_OCE) em 27 colunas
#  Info: No ano de 2006 foram 24 perguntas, em outros anos foram 27 perguntas
#dados <- bd %>%
  #select(NU_ANO, DS_VT_ACE_OCE) %>%
  #separate(DS_VT_ACE_OCE, into = paste0("Q", 1:27), sep = 1:26)
# Converter tudo para dados numéricos
#dados <- dados %>%
  #mutate_all(as.numeric)




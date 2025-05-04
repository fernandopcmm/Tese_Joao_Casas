library(dplyr)
library(tidyr)

#########################################
### Importação e unificação das bases ###
#########################################

#Lista de arquivos

caminho_arquivos = "C:/Users/tumen/OneDrive/Felipe/3-Artigos/TRI/data/"

lista_arquivos = c(paste(caminho_arquivos,"raw/microdados_enade_2022_LGPD/microdados_Enade_2022_LGPD/2.DADOS/microdados2022_arq1.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2018_LGPD/microdados_Enade_2018_LGPD/2.DADOS/microdados2018_arq1.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2015_LGPD/microdados_Enade_2015_LGPD/2.DADOS/microdados2015_arq1.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2012_LGPD/microdados_Enade_2012_LGPD/2.DADOS/microdados2012_arq1.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2009/microdados_Enade_2009_LGPD/2.DADOS/microdados2009_arq1.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2006/microdados_Enade_2006_LGPD/2.DADOS/microdados2006_arq1.txt", sep = "")
)


lista_arquivos_respostas = c(paste(caminho_arquivos,"raw/microdados_enade_2022_LGPD/microdados_Enade_2022_LGPD/2.DADOS/microdados2022_arq3.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2018_LGPD/microdados_Enade_2018_LGPD/2.DADOS/microdados2018_arq3.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2015_LGPD/microdados_Enade_2015_LGPD/2.DADOS/microdados2015_arq3.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2012_LGPD/microdados_Enade_2012_LGPD/2.DADOS/microdados2012_arq3.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2009/microdados_Enade_2009_LGPD/2.DADOS/microdados2009_arq3.txt", sep = ""),
                   paste(caminho_arquivos,"raw/microdados_enade_2006/microdados_Enade_2006_LGPD/2.DADOS/microdados2006_arq3.txt", sep = "")
)



# Criar base vazia para receber os dados
bd = data.frame()

# Loop para pegar todos os dados
for (i in 1:length(lista_arquivos))
  {
    microdados_cadastro <- read.csv(lista_arquivos[i], colClasses=c('character'), sep=";")
    microdados_respostas <- read.csv(lista_arquivos_respostas[i], colClasses=c('character'), sep=";")
        
    # Filtrar cursos de administração (CO_GRUPO = 1)
    microdados_cadastro = microdados_cadastro %>% filter (CO_GRUPO == "1")
    
    #Selecionar as colunas de interesse (NU_ANO, CO_CURSO e DS_VT_ACE_OCE: Vetor de respostas)
    microdados_cadastro = microdados_cadastro %>% select(NU_ANO, CO_CURSO) 
    microdados_respostas = microdados_respostas %>% select(CO_CURSO, DS_VT_ACE_OCE)
    
    # Remover duplicados
    co_curso = microdados_cadastro %>% distinct(CO_CURSO, .keep_all = TRUE)
    
    # Selecionar as respostas apenas dos estudantes dos cursos de Administração
    bd_aux = inner_join(co_curso, microdados_respostas, by="CO_CURSO")
    
    # Colunas finais 
    bd_aux = bd_aux %>% select(NU_ANO, DS_VT_ACE_OCE) 
    
    # Adicionar à base final    
    bd <- rbind(bd, bd_aux) 
}

# Verificar anos
table(bd$NU_ANO)

# Exportar base consolidada para csv (apenas se necessário)
# write.csv2(bd, file = "/home/tumenas/Felipe/Papers/TRI/data/processed/bd_tri_enade_oficial.csv", row.names=F)

# Separar a coluna com o vetor de respostas (DS_VT_ACE_OCE) em 27 colunas
#  Info: No ano de 2006 foram 24 perguntas, em outros anos foram 27 perguntas
dados <- bd %>%
  select(NU_ANO, DS_VT_ACE_OCE) %>%
  separate(DS_VT_ACE_OCE, into = paste0("Q", 1:27), sep = 1:26)

# Converter tudo para dados numéricos
dados <- dados %>%
  mutate_all(as.numeric)

# Exportar base com respostas para csv
write.csv2(dados, file = paste(caminho_arquivos,"processed/bd_tri_enade_respostas.csv", sep = ""), row.names=F)

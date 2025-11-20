library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

# dicionario de dados
discionario_dados <- read_excel("/Users/agsj2/OneDrive/Área de Trabalho/R/microdados_censo_da_educacao_superior_2024/microdados_censo_da_educacao_superior_2024/Anexos/ANEXO I - Dicionário de Dados/dicionário_dados_educação_superior.xlsx")

# dados das instituições
dados_IES <- read.csv("/Users/agsj2/OneDrive/Área de Trabalho/R/microdados_censo_da_educacao_superior_2024/microdados_censo_da_educacao_superior_2024/dados/MICRODADOS_ED_SUP_IES_2024.CSV", sep=';', encoding='latin1')

# dados dos cursos
dados_cursos <- read.csv("/Users/agsj2/OneDrive/Área de Trabalho/R/microdados_censo_da_educacao_superior_2024/microdados_censo_da_educacao_superior_2024/dados/MICRODADOS_CADASTRO_CURSOS_2024.CSV", sep=';', encoding='latin1')


cursos <- data.frame(
  "Curso" = dados_cursos$NO_CINE_ROTULO
)

#contando quantos tem de cada curso

cursos_frequentes <- cursos %>%
  group_by(Curso) %>%
summarise(
  Valores_absolutos = n(),.groups = 'drop') %>%
  mutate(Total_Geral = sum(Valores_absolutos),`Percentual (%)` = round((Valores_absolutos / Total_Geral) * 100, 2)
  )

ord_cursos <- cursos_frequentes %>%
  arrange(desc(Valores_absolutos))
print(ord_cursos)

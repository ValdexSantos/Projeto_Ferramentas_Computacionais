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
  "Curso" = dados_cursos$NO_CINE_ROTULO,
  "Tipo_de_curso"= case_when(
      dados_cursos$TP_GRAU_ACADEMICO == 1 ~ "Bacharelado",
      dados_cursos$TP_GRAU_ACADEMICO == 2 ~ "Licenciatura",
      dados_cursos$TP_GRAU_ACADEMICO == 3 ~ "Tecnólogo",
      dados_cursos$TP_GRAU_ACADEMICO == 4 ~ "Bacharelado e Licenciatura",
      TRUE ~ "Não se aplica" 
    )
  )

#contando quantos tem de cada curso

cursos_frequentes <- cursos %>%
  group_by(Curso) %>%
summarise(
  Quantidade_de_cursos = n(),.groups = 'drop') %>%
  mutate(Total_Geral = sum(Quantidade_de_cursos),`Percentual (%)` = round((Quantidade_de_cursos / Total_Geral) * 100, 2)
  ) %>%
  select(-Total_Geral)

ord_cursos <- cursos_frequentes %>%
  arrange(desc(Quantidade_de_cursos))
print(ord_cursos)

#Verificando o tipo de curso
tipo_curso <- cursos %>%
 group_by(Tipo_de_curso) %>%
 summarise(
   Grau_do_curso =n(),.groups = 'drop') %>%
  mutate(Total_geral = sum(Grau_do_curso),`Percentual (%)` = round((Grau_do_curso / Total_geral) *100, 2)
 ) %>%
  select(-Total_geral)

ord_tipo <- tipo_curso %>%
  arrange(desc(Grau_do_curso))
print(ord_tipo)
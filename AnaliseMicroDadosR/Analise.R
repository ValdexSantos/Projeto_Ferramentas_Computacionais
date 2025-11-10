# Instalando pacote para ler arquivo xlsx do dos microdados
install.packages("readxl")

# Carrega o pacote
library(readxl)

setwd("~/Documentos/Github/Projeto_Ferramentas_Compuacionais/microdados_censo_da_educacao_superior_2024/")

# Arquivo dicionário de dados
dic_dados <- "~/Documentos/Github/Projeto_Ferramentas_Compuacionais/microdados_censo_da_educacao_superior_2024"

pasta<- "~/Documents/Github/Projeto_Ferramentas_Compuacionais"

#getwd()

dir.exists(pasta)
# Lista o conteúdo da pasta
list.files(pasta,recursive = TRUE)



# Lê o arquivo Excel
dic_dados <- read_excel(dic_dados)

# Definindo a pasta de destino (onde os arquivos serão extraídos)
dir <- "~/Documentos/Github/Projeto_Ferramentas_Compuacionais/microdados_censo_da_educacao_superior_2024"


# Confirmando os arquivos 
list.files(dir)


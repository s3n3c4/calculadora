## Calculator S3 NA AWS
### Nuvem escolhida AWS
### Optei por usar o famoso Terraform como IaC

## - Steps  ##
- Fork do projeto

- Clonei o projeto: 
`git clone https://github.com/s3n3c4/calculator.git`

- Adicionei o submódulo:
`git submodule add https://github.com/s3n3c4/calculator.git`

- Realizei o primeiro push

- Clone: `git clone --recurse-submodules https://github.com/s3n3c4/calculator.git`

- Seta as varíaveis AWS_S3_BUCKET; AWS_SECRET_ACCESS_KEY; AWS_ACCESS_KEY_ID (github)


- Criação da IAM pela console AWS
- Criação do Bucket via Iac (Terraform)
- Configuração de CI/CD com gitactions (.github/workflows/main.yaml)
> Obs: O CI/CD já faz todo o processo de criação do S3 e deployment dos arquivos
- O módulo do s3 está na pasta /terraform/

- A esteira de pipeline foi dividada em 3 jobs: terraform npm-install-and-build e deploy


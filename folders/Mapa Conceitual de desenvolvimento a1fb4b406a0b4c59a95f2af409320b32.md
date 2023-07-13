# Mapa Conceitual de desenvolvimento

## Introdução

- Introdução ao Model Based Design
- Modelo usado para desenvovimento do projeto

---

- Modelo do UAV
- Documentação do Mambo Parrot
- Ferramentas de desenvolvimento de

## Análise do Model Based Design - Parrot Simulink

- Controlador Usado - Dificil sintonização
- Contantes somadas para correção
- Comportamentos de Take-off e Land fora do controlador
- Teste de validação de movimento, prejudicam os testes de voo
- Dificil alteração de alvos de navegação em tempo de execução

## Desenvolvimento de Controlador de Posição

- Introdução ao feedback Linearization
- Devido a geração de um sistema linear possui fácil sintonização
    - Sintonização do controlador proposto
    - Avaliação de estabilidade
- Estudo de comportamento do sistema mais simplificado

## Comunicação com a plataforma fisíca

- Uso do python para comunicação com o modelo em tempo de execução
- Controle dos set-points de posição, para gerar navegação
- Acesso dos dados dos sensores em tempo de execução
- Inclusão do uso da camera FPV

## Inclusão do ROS

- Padrão para uso Industrial
- Fácil inclusão a sistemas de controle
- Publicação dos dados dos sensores
    - Imu
    - Altitude(sonar)
    - Camera FPV
- Controle dos set-points
    - X, Y, Z e yaw

## Trabalhos Futuros
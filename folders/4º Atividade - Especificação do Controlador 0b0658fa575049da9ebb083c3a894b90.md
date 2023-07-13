# 4º Atividade - Especificação do Controlador

## Arquivo base de Débora

- Apresenta bom funcionamento apenas para o controlador de altitude
- O controlador não está devidamente sintonizado
    
    [Papers - Google Drive](https://drive.google.com/drive/folders/1kt0lKWHT_vgIIBU-7bhWul3gXeVathgM)
    

## Referências:

[Feedback Lin - Google Drive](https://drive.google.com/drive/folders/1e08DPE2ftRHK6U4-e_z3cQuEbZ-GBAuL)

[](https://arxiv.org/pdf/1906.04263.pdf)

[](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4957154)

[View of Adaptive Feedback Linearization Controller for Stabilization of Quadrotor UAV](https://publisher.uthm.edu.my/ojs/index.php/ijie/article/view/3014/3536)

[Feedback linearization](https://en.wikipedia.org/wiki/Feedback_linearization)

### Modelagem Matematica - UAV

[](https://www.dropbox.com/home/ProjetoCNPq/VANTs?select=UAV+Coordinate+Frames+and+Rigid+Body+Dynamics.pdf&preview=Peter+Corke+-+Robotics,+Vision+and+Control.+Fundamental+Algorithms+In+MATLAB-Springer+(2017).pdf)

[](https://www.dropbox.com/home/ProjetoCNPq/VANTs?select=UAV+Coordinate+Frames+and+Rigid+Body+Dynamics.pdf&preview=UAV+Coordinate+Frames+and+Rigid+Body+Dynamics.pdf)

## Artigo Base - FeedBack Linearizarion - Euller

[](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=5675968)

### Modelo desenvolvido

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled.png)

- Esse nesse trabalho o feedback linearization ocorre com as orientações
- O controle é feita em cascata tendo o controle de orientação inteno e o de posição que gera referencias para o de orientação.

[calculo-feedbackLin.pdf](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/calculo-feedbackLin.pdf)

### Resultados - Model - Equações Diferenciais

- Foi realizada a sintonização do controlador de orientação e de posição, atentando para a necessidade que o mais interno a cascata (orientação) deve apresentar resposta mais rápida quando comparado com de posição.
- Abaixo estão os resultados de uma rotina de voo, com uma decolagem (movimento no eixo Z), movimento dos eixos X e Y e por fim uma variação no angulo de Yaw.
    - Nesse caso a alteração ou não do angulo yaw altera o movimento nos eixos X e Y, sendo necessario uma correção

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%201.png)

### Resultados - Modelo Drone - Simulink

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%202.png)

- Foi incluido como modelo do UAV, o modelo disponivel no suport parrot do simulink
- Para tal foi necessario realizar uma reavaliação da influencia da gravidade no sistema
- A medição dos estados foram feitas direto do modelo ainda sem ruido.

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%203.png)

### Resultados - Inclusão de Sensores - Sinais ruidosos

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%204.png)

- Com a inclusão do modelo dos sensores, também fornecido pelo o suporte do Parrot no simulinik, o sistema apresentou falhas na movimentação em X e Y devido ao erro de orientação.
- Ainda foi nessessario rever os controladores de Altitude já que o sensore de altura principal(sonar) tem uma altura minima de detecção
- Nova sintonização do controlador de de Posição e Attitude são necessarias!
- Inclusão do Filtro de Kalman e estudo de funcionamento do modelo no matlab

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%205.png)

- Resultado já com a inclusão dos sensores ambos realizam convergencia
- Controle de X e Y ainda desacolado do controle de Yaw
    - Necessario mudar o referencial para acoplamento entre os mesmos!!!
    - Resultado do acoplamento, no teste de realizar o L com mudança de Yaw
        
        ![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%206.png)
        

### Teste realizados no simulador do Gazebo

- O teste foi feito por meio do ROS toolbox
- O UAV inicia na posição 1,0,0 e deve ir para a posição 1,0,1 e depois para 0,0,1

![Untitled](4%C2%BA%20Atividade%20-%20Especificac%CC%A7a%CC%83o%20do%20Controlador%200b0658fa575049da9ebb083c3a894b90/Untitled%207.png)

- O fechamento da malha ainda está sendo com os estados do modelo
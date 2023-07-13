# 2º e 3º Atividades - Configuração e reprodução

[Simulink Support Package for Parrot Minidrones
Documentation](https://www.mathworks.com/help/supportpkg/parrot/index.html?s_tid=CRUX_lftnav)

[Welcome to pyparrot’s documentation! — pyparrot 1.5.3 documentation](https://pyparrot.readthedocs.io/en/latest/)

[https://www.dropbox.com/home/ProjetoCNPq/gabriel.vasconcelos/TCC?preview=TCCDNPOliveiraFINAL.pdf](https://www.dropbox.com/home/ProjetoCNPq/gabriel.vasconcelos/TCC?preview=TCCDNPOliveiraFINAL.pdf)

### Tutorial Hover

[Fly a Parrot Minidrone Using Hover Parrot Minidrone Simulink Template
- MATLAB & Simulink](https://www.mathworks.com/help/supportpkg/parrot/ug/fly-a-parrot-minidrone-using-the-hover-simulink-model.html)

![Untitled](2%C2%BA%20e%203%C2%BA%20Atividades%20-%20Configurac%CC%A7a%CC%83o%20e%20reproduc%CC%A7a%CC%83o%205c54d732b4c141bd81337f54a93ae3f8/Untitled.png)

- Possui um modelo de controlador  e um modelo simulado do Drone
    - Assim o controlador pode ser testado de forma simulada antes de implementada na platafroma física
    - O template para geração de código pode ser acessado abrindo como Top Model o subsistema flightControlSystem
    
    ![Untitled](2%C2%BA%20e%203%C2%BA%20Atividades%20-%20Configurac%CC%A7a%CC%83o%20e%20reproduc%CC%A7a%CC%83o%205c54d732b4c141bd81337f54a93ae3f8/Untitled%201.png)
    
    - Assim esse sistema pode ser incluido como controlador do Mambo, por meio de uma interface de geração de codigo.
    
    ![Untitled](2%C2%BA%20e%203%C2%BA%20Atividades%20-%20Configurac%CC%A7a%CC%83o%20e%20reproduc%CC%A7a%CC%83o%205c54d732b4c141bd81337f54a93ae3f8/Untitled%202.png)
    
    - Esse sistema possui alguns sistemas  internos que podem ser resumindo como:
        - Estimador de estados: com uso dos sensores é possivel estimar a pose da plataforma.
        - Planejador de rota: define se o robô estar no estador de decolagem(Take off), voo ou aterrisagem(land).
        - Controlador: realizar a estimação das saída dos atuadores com base nos valores de referencia e estimações dos sensores
    - O planejador tem um problema de suprimir os valores de referencia, ou seja, mesmo alterando os valores de posição na entrada de referencia os sistema não reaje a tal alteração. Porém com alguma investigação foi possivél indentificar tal supressão:
    
    ![Untitled](2%C2%BA%20e%203%C2%BA%20Atividades%20-%20Configurac%CC%A7a%CC%83o%20e%20reproduc%CC%A7a%CC%83o%205c54d732b4c141bd81337f54a93ae3f8/Untitled%203.png)
    
    - Está por sua vez foi corrigida para que fosse possível o testes com a plataforma:
    
    ![Untitled](2%C2%BA%20e%203%C2%BA%20Atividades%20-%20Configurac%CC%A7a%CC%83o%20e%20reproduc%CC%A7a%CC%83o%205c54d732b4c141bd81337f54a93ae3f8/Untitled%204.png)
    
    - O controlador foi incluido na plataforma, e após a compilação é aberta uma interface de teste, que possui um botão de parada emergencial e um de pouso.
    - Além disso a interface possui a ferramenta de gerar arquivos .log que possui dados dos sensores e entradas dos motores.

### Debug em tempo real

- Problemas como o firmware alterado do simulink, limita a comunicação
- Incluir o firmware original e tentar controlar o drone com o matlab e não o simulink

[How to visualize Images and data with parrot mambo minidrone?](https://www.mathworks.com/matlabcentral/answers/465346-how-to-visualize-images-and-data-with-parrot-mambo-minidrone)

- Provalmente irá resolver o problema do não funcionamento do pyparrot
- O Modelo e mambo parrot disponivél não possui conexão wifi impossibilitando o uso do package do matlab que permite tal fluxo de dados
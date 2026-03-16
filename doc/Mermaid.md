# Código mermaid

stateDiagram-v2
    [*] --> q0

    q0 --> qI : I / 1
    q0 --> qV : V / 5
    q0 --> qX : X / 10
    q0 --> qL : L / 50
    q0 --> qC : C / 100
    q0 --> qD : D / 500
    q0 --> qM : M / 1000

    qI --> qI : I / 1
    qX --> qX : X / 10
    qC --> qC : C / 100
    qM --> qM : M / 1000

    qI --> qV : V / 4
    qI --> qX : X / 9

    qX --> qL : L / 40
    qX --> qC : C / 90

    qC --> qD : D / 400
    qC --> qM : M / 900

    qV --> qErro : V repetido
    qL --> qErro : L repetido
    qD --> qErro : D repetido

    qI --> qErro : I > 3
    qX --> qErro : X > 3
    qC --> qErro : C > 3
    qM --> qErro : M > 3

    qI --> qErro : subtração inválida
    qX --> qErro : subtração inválida
    qC --> qErro : subtração inválida

    q0 --> qErro : símbolo inválido

    qV --> q0 : próxima leitura
    qL --> q0 : próxima leitura
    qD --> q0 : próxima leitura
    qM --> q0 : próxima leitura

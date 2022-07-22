# Instalação

add o PATH da pasta /bin na sua variável de ambiente

`export PATH=$PATH:"$HOME/caminho-da-pasta/bin"`

- Caso esteja em SO diferente de MacOS, necessita fazer um build para o seu sistema, tenha o dart sdk instalado na sua máquina e rode o seguinte comando dentro da pasta atlas

`dart compile exe bin/main.dart -o bin/atlas`

# Para utilização 

Acessar a pasta do Flutter Atomic Design

`atlas generate [atom molecule ou organism] <nome-do-componente>`



algoritmo "jogo"

var
zona : vetor[1..6,1..5] de inteiro
zonaitem : vetor[1..6,1..5] de inteiro
mapa : vetor[1..6,1..5] de caracter
mapaitem : vetor[5..8] de caracter
mapainimigo : vetor[0..4] de caracter
tipoinimigo : vetor[0..4] de caracter
inimigoAtaque : vetor[0..8] de caracter
opcaoMenuPrincipal : inteiro
opcaoMenu : inteiro
posicao : vetor[0..1] de inteiro
montarMapa : vetor[0..1] de inteiro
inventario : vetor[1..8] de inteiro
randTipoInimigo : inteiro
randInimigoAtaque : inteiro
randItem : inteiro
vidaGarra : inteiro

// 1 - Colete a Prova de Balas
// 2 - Jato d'�gua
// 3 - Abafadores Sonoros
// 4 - Chap�u Bugiganga
// 5 - �culos Escuro
// 6 - Lupa
// 7 - Lanterna
// 8 - Pistola

inicio

procedimento mudainimigo()
inicio
se posicao[0] <> 1 entao
   randTipoInimigo <- randi(4)
   randInimigoAtaque <- randi(8)

   mapainimigo[0] <- " Opa, voc� esbarrou em um "
   mapainimigo[1] <- " Voc� encontrou de cara mais um "
   mapainimigo[2] <- " H� um "
   mapainimigo[3] <- " Voc� deu de frente com um "
senao
   randTipoInimigo <- randi(4)
   randInimigoAtaque <- randi(8)

   tipoinimigo[0] <- "Garra"
   tipoinimigo[1] <- "Garra"
   tipoinimigo[2] <- "Garra"
   tipoinimigo[3] <- "Garra"
   mapainimigo[0] <- " O Dr. "
   mapainimigo[1] <- " O Dr. "
   mapainimigo[2] <- " O Dr. "
   mapainimigo[3] <- " O Dr. "
fimse

fimprocedimento

procedimento comandoataque()       // Exibe os Comandos de Ataque ou A��o
var
opcaoAtaque : inteiro
inicio
escreval()
escreval("Voc� tem:")
escreval()
se inventario[1]>0 entao
   escreval("1 - Colete a Prova de Balas")
fimse
se inventario[2]>0 entao
   escreval("2 - Jato d'�gua")
fimse
se inventario[3]>0 entao
   escreval("3 - Abafadores Sonoros")
fimse
se inventario[4]>0 entao
   escreval("4 - Chap�u Bugiganga")
fimse
se inventario[5]>0 entao
   escreval("5 - �culos Escuro")
fimse
se inventario[6]>0 entao
   escreval("6 - Lupa")
fimse
se inventario[7]>0 entao
   escreval("7 - Lanterna")
fimse
se inventario[8]>0 entao
   escreval("8 - Pistola")
fimse
//  LEITURA DO ATAQUE
escreval()
escreval("     .-.________")
escreval("----/ \ )_______)")
escreval("   (  (/()___)")
escreval("        ()__)")
escreval("----\___()_)")
escreva("                   ")
leia(opcaoAtaque)

escolha opcaoAtaque    // ATAQUE X DEFESA

caso 1
   se inventario[1]>0 entao     // Checa se o item est� dispon�vel

      escolha randInimigoAtaque // Se ataque do inimigo for Pistola, ent�o...
      caso 0
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[1] <- inventario[1]-1
         limpatela
         escreval(" Voc� se defendeu dos tiros do ",tipoinimigo[randTipoInimigo]," logo voc� o derrotou")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 2
   se inventario[2]>0 entao

      escolha randInimigoAtaque
      caso 1
         // Se ataque do inimigo for Lan�a-Chamas, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[2] <- inventario[2]-1
         limpatela
         escreval(" O Jato de �gua anulou o fogo inimigo e voc� utilizou outro ataque sobre o mesmo ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[2] <- inventario[2]-1
         limpatela
         escreval(" O ",tipoinimigo[randTipoInimigo]," recebeu um ataque de �gua e escorregou, voc� foi vitorioso ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 3
   se inventario[3]>0 entao

      escolha randInimigoAtaque
      caso 2
         // Se ataque do inimigo for Onda Sonora, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         inventario[3] <- inventario[3]-1
         fimse
         limpatela
         escreval(" Seu abafador Sonoro anulou o ataque inimigo e voc� o atacou sucessivamente em seguida ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha
   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 4
   se inventario[4]>0 entao

      escolha randInimigoAtaque
      caso 0
         // Se ataque do inimigo for Pistola, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" seu Chap�u Bugiganga defendeu o ataque com um escudo, e voc� o atacou devidamente ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 1
         // Se ataque do inimigo for Lan�a-Chamas, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" do Chap�u Bugiganga saiu uma arma gigante de �gua que afogou o ",tipoinimigo[randTipoInimigo]," e atenuou sua muni��o de fogo  ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 2
         // Se ataque do inimigo for Onda Sonora, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Do seu incr�vel Chap�u Bugiganga saiu um abafador de som hibr�do, o qual tamb�m emitiu um som de alt�ssima intensidade e derrotou o ",tipoinimigo[randTipoInimigo])
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Voc� acaba de gerar uma luva de Boxe rob�tica em tamanho Grande, e acerta um belo Uppercut no seu opontente ",tipoinimigo[randTipoInimigo])
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 4
         // Se ataque do inimigo for Lanterna, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Seu Chap�u Lan�ou uma lente escura sobre seu rosto rapidamente, e voc� enxergou o ",tipoinimigo[randTipoInimigo]," atacando-o em seguida ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 5
         // Se ataque do inimigo for Ataque Helic�ptero, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Acabas de utilizar uma Bazooka de seu Chap�u Bugiganga contra o Helic�ptero do ",tipoinimigo[randTipoInimigo]," sobrevoando, j� pode seguir sua jornada sem o inc�modo dele ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 6
         // Se ataque do inimigo for Raio Ultra-violeta, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Seu Chap�u Bugiganga refletiu os raios ultravioleta com uma lente gerada pela tecnologia do chap�u, logo o ",tipoinimigo[randTipoInimigo]," ficou torrado no ch�o")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 7
         // Se ataque do inimigo for Faca, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Voc� lan�ou um chiclete ultra-gosmento contra o ",tipoinimigo[randTipoInimigo]," usando a tecnologia Bugiganga, ele ficou preso antes de lhe atacar, siga sua jornada")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 5
   se inventario[5]>0 entao

      escolha randInimigoAtaque // Se ataque do inimigo for Lanterna, ent�o...
      caso 4
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[5] <- inventario[5]-1
         limpatela
         escreval(" Voc� se protegeu com os �culos Escuros da luz emitida pela Lanterna do ",tipoinimigo[randTipoInimigo]," logo voc� o derrotou em seguida")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval(" Voc� n�o se defendeu do ataque ultra-violeta do ",tipoinimigo[randTipoInimigo])
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 6
   se inventario[6]>0 entao

      se randInimigoAtaque=6 entao // Se ataque do inimigo for Utra-violeta, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         inventario[6] <- inventario[6]-1
         fimse
         limpatela
         escreval(" Voc� se defendeu dos raios ultravioleta do ",tipoinimigo[randTipoInimigo]," e refletiu com a Lente de Sua Lupa, devolvendo o ataque")
         mostraposicao()

      senao

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimse
   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 7
   se inventario[7]>0 entao

      se randInimigoAtaque=0 entao // Se ataque do inimigo for Pistola, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         limpatela
         escreval(" O ",tipoinimigo[randTipoInimigo]," foi cegado com sua Lanterna e n�o lhe acertou o disparo, voc� venceu a batalha")
         mostraposicao()

      senao

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimse

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 8
   se inventario[8]>0 entao

      escolha randInimigoAtaque
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         fimse
         inventario[8] <- inventario[8]-1
         limpatela
         escreval(" Voc� utilizou sua Pistola contra o ",tipoinimigo[randTipoInimigo]),", menos um criminoso na cidade")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 7
         // Se ataque do inimigo for Faca, ent�o...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         fimse
         limpatela
         escreval(" Voc� utilizou sua Pistola contra o ",tipoinimigo[randTipoInimigo]),", menos um criminoso na cidade")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga n�o defendeu o ataque inimigo, voc� foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item dispon�vel da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse

outrocaso

   limpatela
   escreval("Digite um item dispon�vel da lista")
   escreval()
   mostraposicao()
   comandoataque()

fimescolha

fimprocedimento

procedimento comandoposicao()      // Exibe os comandos de Navega��o
var
opcaoPosicao : inteiro
inicio

se zonaitem[posicao[0],posicao[1]]=1 entao //Checa se h� um item no local
   escreval()
   escreval("(5) Analisar Ambiente")

fimse

escreval()
se posicao[0]>1 entao
   escreval("(1) Ir Para Frente")
fimse
se posicao[1]>1 entao
   escreval("(2) Ir Para Esquerda")
fimse
se posicao[1]<5 entao
   escreval("(3) Ir Para Direita")
fimse
se posicao[0]<6 entao
   escreval("(4) Ir Para Tr�s")
fimse
escreval()
escreval()
escreval()
escreval()
escreval()
se vidaGarra <> 0 entao
leia(opcaoPosicao)
senao
sair()
fimse
escolha opcaoPosicao
caso 1
   se posicao[0]>1 entao
      posicao[0] <- posicao[0]-1
      limpatela
      mudainimigo()
      mostraposicao()
   senao
      limpatela
      escreval(" Voc� n�o pode ir para Frente!")
      escreval()
      mostraposicao()
      comandoposicao()
   fimse
caso 2
   se posicao[1]>1 entao
      posicao[1] <- posicao[1]-1
      limpatela
      mudainimigo()
      mostraposicao()
   senao
      limpatela
      escreval(" Voc� n�o pode ir para Esquerda!")
      escreval()
      mostraposicao()
      comandoposicao()
   fimse
caso 3
   se posicao[1]<5 entao
      posicao[1] <- posicao[1]+1
      limpatela
      mudainimigo()
      mostraposicao()
   senao
      limpatela
      escreval(" Voc� n�o pode ir para Direita!")
      escreval()
      mostraposicao()
      comandoposicao()
   fimse
caso 4
   se posicao[0]<6 entao
      posicao[0] <- posicao[0]+1
      limpatela
      mudainimigo()
      mostraposicao()
   senao
      limpatela
      escreval(" Voc� n�o pode ir para Tr�s!")
      escreval()
      mostraposicao()
      comandoposicao()
   fimse

caso 5
   se zonaitem[posicao[0],posicao[1]]=1 entao

      inventario[randItem]<-inventario[randItem]+1
      zonaitem[posicao[0],posicao[1]] <- 0
      limpatela
      escreval()
      escreval(mapaitem[randItem])

      escolha randItem

      caso 5

         escreval()
         escreval()
         escreval("                   ________     ________")
         escreval("             . - ~|        |-^-|        |~ - .")
         escreval("           {      |        |   |        |      }")
         escreval("            \)    \            *        |")
         escreval("                   `.____.'     `.____.'")
         escreval()
         escreval()
         escreval()

      caso 6

         escreval()
         escreval()
         escreval("                           ______              ")
         escreval("                        .-'      `-.           ")
         escreval("                      .'            `.         ")
         escreval("                     /                \        ")
         escreval("                    |                 |        ")
         escreval("                                     ;|        ")
         escreval("                    \               / ;        ")
         escreval("                     \`.           .' /        ")
         escreval("                      `.`-._____.-' .'         ")
         escreval("                        / /`_____.-'           ")
         escreval("                       / / /                   ")
         escreval("                      / / /                    ")
         escreval("                     / / /                     ")
         escreval("                     \/_/                      ")


      caso 7

         escreval()
         escreval()
         escreval("                                  _.----.   /")
         escreval("                .----------------' /  /  \   _")
         escreval("               (     BUGIGANGA  | |   |) |   _")
         escreval("                `----------------._\  \  /   _ ")
         escreval("                                   '----'   \")
         escreval()
         escreval()
         escreval()

      caso 8

         escreval()
         escreval("                ___________________________________,")
         escreval("            ___/  ////////  \____/                 |")
         escreval("           <__ |_////////__________________________|")
         escreval("             \)                 *        |________|")
         escreval("              /        __________________|")
         escreval("             /        /  ||   //")
         escreval("            /        /____\__//")
         escreval("           /        /~~~~~~~~~")
         escreval("          /        /")
         escreval("          \-------/")

      fimescolha

      timer(2500)
      timer(3)
      limpatela
      mostraposicao()
      comandoposicao()
   fimse

outrocaso

   limpatela
   escreval()
   escreval("Dire��o inv�lida!")
   timer(3000)
   timer(3)
   limpatela
   mostraposicao()

fimescolha


fimprocedimento
procedimento mostraposicao()      // Mostra o evento da posi��o atual
inicio
randItem <- randi(3)+5
se zona[posicao[0],posicao[1]]=0  entao
   se vidaGarra <> 0 entao
      escreval(mapa[posicao[0],posicao[1]])
      comandoposicao()
   senao
      limpatela
      escreval(" Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!")
      timer(5500)
      timer(2)
      sair()
   fimse
senao
   escreval(mapainimigo[randTipoInimigo],tipoinimigo[randTipoInimigo],inimigoAtaque[randInimigoAtaque],", qual sua pr�xima a��o Inspetor Bugiganga?")
   comandoataque()
fimse

fimprocedimento

procedimento mudaposicao()
inicio
fimprocedimento

procedimento creditos()
inicio
limpatela
escreval()
escreval(" Jogo desenvolvido pela Equipe TeamPanz�, cujos membros s�o")
escreval(" alunos da Institui��o de Ensino FAPAN")
escreval(" Membros: Ivo Miranda & Felipe Carlos")
escreval()
miniMenu()
fimprocedimento

procedimento sair()
inicio
limpatela
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval("                 Obrigado por jogar nosso Game!!!")
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
escreval()
reset()
timer(2400)
fimalgoritmo
fimprocedimento

procedimento instrucoes()
inicio
limpatela
escreval()
escreval(" - Voc� como Inspetor Bugiganga, pode caminhar pela Cidade ")
escreval(" Utilize os numeradores 1, 2, 3 e 4 para determinar a dire��o ")
escreval(" o qual ir� seguir ")
escreval(" - Haver� v�rios obst�culos e inimigos durante sua jornada ")
escreval(" Sua lista de itens e utilit�rios ajudar�o a derrotar quem ")
escreval(" o confronte, e a superar desafios. ")
escreval(" - Seu objetivo final � descobrir o respons�vel pelo ")
escreval(" caos na cidade e restaurar a paz na mesma. ")
escreval()
miniMenu()
fimprocedimento

procedimento miniMenu()     // MINI M E N U
inicio
escreval()
escreval("                   (1) Voltar ao Menu Principal")
escreval("                   (2) Sair do Jogo")
escreval()
escreva("                          Comando: ")
leia(opcaoMenu)
escreval()
ESCOLHA opcaoMenu
CASO 1
limpatela
menu()
CASO 2
sair()
OUTROCASO
escreval("Digite uma op��o v�lida!")
miniMenu()
fimescolha
fimprocedimento

procedimento menu()        // M E N U  PRINCIPAL
inicio
opcaoMenuPrincipal <- 0
escreval("                           CARREGANDO...")
escreval()
escreval("----------------------------------------------------------------")
escreval("  ___   _   _   ____    ____    _____   _____    ___    ____")
escreval(" |_ _| | \ | | / ___|  |  _ \  | ____| |_   _|  / _ \  |  _ \ ")
escreval("  | |  |  \| | \___ \  | |_) | |  _|     | |   | | | | | |_) |")
escreval("  | |  | |\  |  ___) | |  __/  | |___    | |   | |_| | |  _ < ")
escreval(" |___| |_| \_| |____/  |_|     |_____|   |_|    \___/  |_| \_\")
escreval("     ___   _   _   ___  ___   ___    _    _  _   ___    _   ")
escreval("    | _ ) | | | | / __||_ _| / __|  /_\  | \| | / __|  /_\  ")
escreval("    | _ \ | |_| || (_ | | | | (_ | / _ \ | .` || (_ | / _ \ ")
escreval("    |___/  \___/  \___||___| \___|/_/ \_\|_|\_| \___|/_/ \_\")
escreval()
escreval("                         Menu do Jogo")
escreval()
escreval("                      (1) Iniciar Jogo")
escreval("                      (2) Ver Instru��es")
escreval("                      (3) Cr�ditos")
escreval("                      (4) Sair do Jogo")
escreval("----------------------------------------------------------------")
escreva("                          Comando: ")
leia(opcaoMenuPrincipal)
ESCOLHA opcaoMenuPrincipal
CASO 1
jogo()
CASO 2
instrucoes()
CASO 3
creditos
CASO 4
sair()
OUTROCASO
limpatela
escreval("                   Digite uma op��o v�lida!")
timer(1380)
timer(3)
menu()
fimescolha

fimprocedimento


procedimento jogo()
var
vidas : inteiro
inventario : vetor[1..8]
inicio
reset()
limpatela
posicao[0] <- 6    // Posi��o inicial Eixo X
posicao[1] <- 3    // Posi��o inicial Eixo Y
inventario[1] <- 1
inventario[2] <- 3
inventario[3] <- 4
inventario[4] <- 1
inventario[5] <- 0
inventario[6] <- 0
inventario[7] <- 0
inventario[8] <- 0
mostraposicao()
fimprocedimento

timer(41)

escreval("                                             .???. ")
escreval("                                     .?.       ?.?#??.")
escreval("                                 ..!???.      .??@7??.")
escreval("                       ..??????????????????????77?7??..")
escreval("                    .??????777777?77????????7!???7J???")
escreval("                  .??(7?????????????????????????7#???!")
escreval("                 .?7@????????????????????????7777777??.")
escreval("              .???@77#????????7??....??????????(7????.")
escreval("            .??77??????????????.     .??????????7??57")
escreval("        ..%??#77????????????7?.       .??????7??%??3  1")
escreval("     .?????*   ?(?????????7?  ??? ?!  .??????=  .?????????")
escreval("   .????.        ??77????7? ??????      .????    777777? ? ")
escreval("  .???   ?????5.  ???!???????! 777?   ?(??    .   7 7??*7. ??.")
escreval("  ???.  ?777?????..??7??7?  ?77#????  ??@77. .?   ?77 ??,?")
escreval(" (???    7  777.777.777777  7  . ???  ? ??? ???   77 ??.?A")
escreval("??.???         77???.???7?  7   .777777777 77777.7  ??.?")
escreval(" ???.???..      7777 77777777  7   .???????#?????%??? ??.?")
escreval(" A?????..???.  777. 7777777     7.?5???.  ???   ??.????.")
escreval("    ???????7??. 773?????7?7?     7777.7  7?@???      .???")
escreval("       ??.???7?? ? 5?C???(???.              777       . ?.")
escreval("        ?7777777777?7???7?7?777                        ..??.")
escreval("        ??.?7?77???77777??7?7777                       ..$?...")
escreval("         .????7????77?77577?7?A???????7                .???????.")
escreval("         ??.?77@?7??7??777??$?1       77??7         ??..    ??.")
escreval("        ?..??.??7????777777777            777777777.. .7 77777")
escreval("          ???7777..7.77777?77777                    7? ?????5")
escreval("        ????..???????????????????J           777???? ???(???")
escreval("           ???????????..........??? ?77???????????? ???(???")
escreval("                     ????????????.3???           ?????.?")
escreval("                              ?????5.??????????????..??")
escreval("                                    ??????????????????")
escreval("                                   ????????????????")
escreval()
escreval("                      TeamPanz� Apresenta:")

timer(40)
procedimento reset()
inicio
zona[2,2] <- 1
zona[2,3] <- 1
zona[2,4] <- 1
zona[3,1] <- 1
zona[3,3] <- 1            //INIMIGOS NO MAPA
zona[3,5] <- 1
zona[4,2] <- 1
zona[4,3] <- 1
zona[5,2] <- 1
zona[6,1] <- 1
zona[6,4] <- 1
zona[1,1] <- 3
zona[1,2] <- 3
zona[1,3] <- 3
zona[1,4] <- 3
zona[1,5] <- 3

zonaitem[6,5] <- 1
zonaitem[6,2] <- 1
zonaitem[4,1] <- 1            //ITENS NO MAPA
zonaitem[3,4] <- 1
zonaitem[4,3] <- 1
zonaitem[5,4] <- 1

// Descri��o dos pontos do Mapa (NARRATIVA)

mapa[6,1] <- " Garagem da sua Central de Opera��es Bugiganga, os ve�culos usados contra o Sobrinho de um certo algu�m est�o aqui."
mapa[6,2] <- " Voc� est� na sua Sede de Opera��es Bugiganga, aqui h� armas Lasers Bugiganga, Protoc�los Bugiganga de Defesa e Ataque, por�m nenhum recurso est� dispon�vel, h� suspeita que a Central de Comunica��es est� danificada."
mapa[6,3] <- " Voc� Inspetor Bugiganga, est� detectando um crescimento descontrolado da criminalidade, sua miss�o � desvender o motivo por tr�s desse ocorrido, e combater o crime na cidade com suas Bugigangas. Digite qual dire��o inicial voc� ir� embarcar nessa aventura:"
mapa[6,4] <- " Neste ponto h� um beco vizinho a sua casa Bugiganga, e diversas lembran�as com sua sobrinha Penny, antes da sua opera��o m�dica, que o tornou o que voc� �."
mapa[6,5] <- " Est� no final do seu bairro, bem longe do perigo, por�m distante da Torre de Vigil�ncia a frente da sua casa."
mapa[5,1] <- " H� destro�os espalhados por aqui, muito semelhante a Estragos feitos por seu Antagonista Principal, nesse ponto n�o d� para duvidar de mais nada."
mapa[5,2] <- " Ponto de �nibus no local, ainda com bastante criminosos a frente, talvez seja bom se preparar para Combater alguns."
mapa[5,3] <- " Daqui � poss�vel ver muito a frente uma torre de vigil�ncia a qual n�o estava ali antes, talvez seja uma base de criminosos comandada por uma for�a maior, al�m disso a apenas alguns metros de voc� h� um grupo de Foras da Lei, cuidado."
mapa[5,4] <- " Aqui parece ser o Lugar que voc� escorregou n'uma banana, e por conta disso, teve o corpo reconstru�do de Bugigangas. Voc� est� pr�ximo de um grupo nesse momento."
mapa[5,5] <- " H� uma Delegacia da pol�cia a sua frente, � justo a qual voc� trabalhava inicialmente, siga em FRENTE"
mapa[4,1] <- " Seu objetivo est� cada vez mais pr�ximo, o cuidado para usar a melhor estrat�gia em combate ainda � v�lida."
mapa[4,2] <- " Aqui pelo jeito, � a regi�o de maior concentra��o dos crimes de horda desses criminosos, justo o centro da cidade..."
mapa[4,3] <- " Est� no principal atrativo da cidade, ponto com uma pra�a e diversas bancas com lanchonetes e sorveterias diversas."
mapa[4,4] <- " Aqui pelo jeito, � a regi�o de maior concentra��o dos crimes de horda desses criminosos, justo o centro da cidade..."
mapa[4,5] <- " � poss�vel ver uma ponte daqui, "
mapa[3,1] <- " H� um padr�o de crimes no mapa da cidade, que formam 3 letras, provavelmente quem arquitetou tudo isso bolou alguma estrat�gia"
mapa[3,2] <- " Voc� est� no in�cio do jogo"
mapa[3,3] <- " Voc� est� no in�cio do jogo"
mapa[3,4] <- " Voc� est� no in�cio do jogo"
mapa[3,5] <- " Voc� est� no in�cio do jogo"
mapa[2,1] <- " Voc� est� no in�cio do jogo"
mapa[2,2] <- " Voc� est� no in�cio do jogo"
mapa[2,3] <- " Voc� est� no in�cio do jogo"
mapa[2,4] <- " Voc� est� no in�cio do jogo"
mapa[2,5] <- " Voc� est� no in�cio do jogo"
mapa[1,1] <- " Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!"
mapa[1,2] <- " Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!"
mapa[1,3] <- " Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!"
mapa[1,4] <- " Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!"
mapa[1,5] <- " Voc� finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARAB�NS pela finalizan��o da trama do inspetor bugiganga!"

mapaitem[5] <- "               Voc� encontrou um �culos Escuro"
mapaitem[6] <- "                   Voc� encontrou uma Lupa"
mapaitem[7] <- "                 Voc� encontrou uma Lanterna"
mapaitem[8] <- "                 Voc� encontrou uma Pistola"

// Tipos de Inimigos

tipoinimigo[0] <- "Crimioso"
tipoinimigo[1] <- "Chefe do Crime"
tipoinimigo[2] <- "Cafet�o"
tipoinimigo[3] <- "Bandido"

// Varia��es de ataques dos Inimigos

inimigoAtaque[0] <- " ele est� Sacando uma pistola e preparando para atirar em sua dire��o"
inimigoAtaque[1] <- " ele pegou um lan�a-chamas e est� acionando a arma pra queima-lo"
inimigoAtaque[2] <- " Com uma roupa tecnol�gica, a qual emite ondas sonoras de alta frequ�ncia, danificando a audi��o do seu alvo, ele est� em prontid�o para efetuar esse ataque contra voc�!"
inimigoAtaque[3] <- " almejando o Combate corpo a corpo, indo em sua dire��o na maior velocidade poss�vel"
inimigoAtaque[4] <- " o qual est� pegando uma Lanterna na tentativa de dispersar sua vis�o"
inimigoAtaque[5] <- " ele est� sobrevoando os c�us com um helic�ptero de combate, manejando o mesmo para iniciar um ataque sobre voc�"
inimigoAtaque[6] <- " emitindo um raio ultravioleta de alt�ssima intensidade para disparar na sua dire��o"
inimigoAtaque[7] <- " empunhando uma faca para lhe acertar"

vidaGarra <- 3 // HP do Chef�o ( Dr. Garra )

timer(2)
fimprocedimento

// 1 - Colete a Prova de Balas
// 2 - Jato de �gua
// 3 - Abafadores Sonoros
// 4 - Chap�u Bugiganga
// 5 - �culos Escuro
// 6 - Lupa
// 7 - Lanterna
// 8 - Pistola

// Vidas, Invent�rio, Andar pelo Cen�rio com Narrativa
// Intera��o com Objetos

reset() // Reset de Dados
menu() // JOGO


fimalgoritmo

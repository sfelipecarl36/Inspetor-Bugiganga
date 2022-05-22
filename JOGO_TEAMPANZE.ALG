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
// 2 - Jato d'água
// 3 - Abafadores Sonoros
// 4 - Chapéu Bugiganga
// 5 - Óculos Escuro
// 6 - Lupa
// 7 - Lanterna
// 8 - Pistola

inicio

procedimento mudainimigo()
inicio
se posicao[0] <> 1 entao
   randTipoInimigo <- randi(4)
   randInimigoAtaque <- randi(8)

   mapainimigo[0] <- " Opa, você esbarrou em um "
   mapainimigo[1] <- " Você encontrou de cara mais um "
   mapainimigo[2] <- " Há um "
   mapainimigo[3] <- " Você deu de frente com um "
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

procedimento comandoataque()       // Exibe os Comandos de Ataque ou Ação
var
opcaoAtaque : inteiro
inicio
escreval()
escreval("Você tem:")
escreval()
se inventario[1]>0 entao
   escreval("1 - Colete a Prova de Balas")
fimse
se inventario[2]>0 entao
   escreval("2 - Jato d'água")
fimse
se inventario[3]>0 entao
   escreval("3 - Abafadores Sonoros")
fimse
se inventario[4]>0 entao
   escreval("4 - Chapéu Bugiganga")
fimse
se inventario[5]>0 entao
   escreval("5 - Óculos Escuro")
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
   se inventario[1]>0 entao     // Checa se o item está disponível

      escolha randInimigoAtaque // Se ataque do inimigo for Pistola, então...
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
         escreval(" Você se defendeu dos tiros do ",tipoinimigo[randTipoInimigo]," logo você o derrotou")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 2
   se inventario[2]>0 entao

      escolha randInimigoAtaque
      caso 1
         // Se ataque do inimigo for Lança-Chamas, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[2] <- inventario[2]-1
         limpatela
         escreval(" O Jato de Água anulou o fogo inimigo e você utilizou outro ataque sobre o mesmo ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[2] <- inventario[2]-1
         limpatela
         escreval(" O ",tipoinimigo[randTipoInimigo]," recebeu um ataque de água e escorregou, você foi vitorioso ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 3
   se inventario[3]>0 entao

      escolha randInimigoAtaque
      caso 2
         // Se ataque do inimigo for Onda Sonora, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         inventario[3] <- inventario[3]-1
         fimse
         limpatela
         escreval(" Seu abafador Sonoro anulou o ataque inimigo e você o atacou sucessivamente em seguida ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha
   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 4
   se inventario[4]>0 entao

      escolha randInimigoAtaque
      caso 0
         // Se ataque do inimigo for Pistola, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" seu Chapéu Bugiganga defendeu o ataque com um escudo, e você o atacou devidamente ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 1
         // Se ataque do inimigo for Lança-Chamas, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" do Chapéu Bugiganga saiu uma arma gigante de água que afogou o ",tipoinimigo[randTipoInimigo]," e atenuou sua munição de fogo  ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 2
         // Se ataque do inimigo for Onda Sonora, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Do seu incrível Chapéu Bugiganga saiu um abafador de som hibrído, o qual também emitiu um som de altíssima intensidade e derrotou o ",tipoinimigo[randTipoInimigo])
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Você acaba de gerar uma luva de Boxe robótica em tamanho Grande, e acerta um belo Uppercut no seu opontente ",tipoinimigo[randTipoInimigo])
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 4
         // Se ataque do inimigo for Lanterna, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Seu Chapéu Lançou uma lente escura sobre seu rosto rapidamente, e você enxergou o ",tipoinimigo[randTipoInimigo]," atacando-o em seguida ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 5
         // Se ataque do inimigo for Ataque Helicóptero, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Acabas de utilizar uma Bazooka de seu Chapéu Bugiganga contra o Helicóptero do ",tipoinimigo[randTipoInimigo]," sobrevoando, já pode seguir sua jornada sem o incômodo dele ")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 6
         // Se ataque do inimigo for Raio Ultra-violeta, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Seu Chapéu Bugiganga refletiu os raios ultravioleta com uma lente gerada pela tecnologia do chapéu, logo o ",tipoinimigo[randTipoInimigo]," ficou torrado no chão")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 7
         // Se ataque do inimigo for Faca, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         inventario[4] <- inventario[4]-1
         limpatela
         escreval(" Você lançou um chiclete ultra-gosmento contra o ",tipoinimigo[randTipoInimigo]," usando a tecnologia Bugiganga, ele ficou preso antes de lhe atacar, siga sua jornada")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 5
   se inventario[5]>0 entao

      escolha randInimigoAtaque // Se ataque do inimigo for Lanterna, então...
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
         escreval(" Você se protegeu com os Óculos Escuros da luz emitida pela Lanterna do ",tipoinimigo[randTipoInimigo]," logo você o derrotou em seguida")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()

      outrocaso

         limpatela
         escreval(" Você não se defendeu do ataque ultra-violeta do ",tipoinimigo[randTipoInimigo])
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 6
   se inventario[6]>0 entao

      se randInimigoAtaque=6 entao // Se ataque do inimigo for Utra-violeta, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         inventario[6] <- inventario[6]-1
         fimse
         limpatela
         escreval(" Você se defendeu dos raios ultravioleta do ",tipoinimigo[randTipoInimigo]," e refletiu com a Lente de Sua Lupa, devolvendo o ataque")
         mostraposicao()

      senao

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimse
   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 7
   se inventario[7]>0 entao

      se randInimigoAtaque=0 entao // Se ataque do inimigo for Pistola, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         mudainimigo()
         fimse
         limpatela
         escreval(" O ",tipoinimigo[randTipoInimigo]," foi cegado com sua Lanterna e não lhe acertou o disparo, você venceu a batalha")
         mostraposicao()

      senao

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimse

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse
caso 8
   se inventario[8]>0 entao

      escolha randInimigoAtaque
      caso 3
         // Se ataque do inimigo for Corpo a Corpo, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         fimse
         inventario[8] <- inventario[8]-1
         limpatela
         escreval(" Você utilizou sua Pistola contra o ",tipoinimigo[randTipoInimigo]),", menos um criminoso na cidade")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()
      caso 7
         // Se ataque do inimigo for Faca, então...
         se posicao[0] <> 1 entao
         zona[posicao[0],posicao[1]] <- 0
         senao
         vidaGarra <- vidaGarra - 1
         zona[posicao[0],posicao[1]] <- zona[posicao[0],posicao[1]] - 1
         fimse
         limpatela
         escreval(" Você utilizou sua Pistola contra o ",tipoinimigo[randTipoInimigo]),", menos um criminoso na cidade")
         timer(5000)
         timer(3)
         limpatela
         mostraposicao()


      outrocaso

         limpatela
         escreval("Essa bugiganga não defendeu o ataque inimigo, você foi derrotado!")
         timer(2500)
         limpatela
         timer(3)
         menu()
      fimescolha

   senao
      limpatela
      escreval("Digite um item disponível da lista")
      escreval()
      mostraposicao()
      comandoataque()
   fimse

outrocaso

   limpatela
   escreval("Digite um item disponível da lista")
   escreval()
   mostraposicao()
   comandoataque()

fimescolha

fimprocedimento

procedimento comandoposicao()      // Exibe os comandos de Navegação
var
opcaoPosicao : inteiro
inicio

se zonaitem[posicao[0],posicao[1]]=1 entao //Checa se há um item no local
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
   escreval("(4) Ir Para Trás")
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
      escreval(" Você não pode ir para Frente!")
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
      escreval(" Você não pode ir para Esquerda!")
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
      escreval(" Você não pode ir para Direita!")
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
      escreval(" Você não pode ir para Trás!")
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
   escreval("Direção inválida!")
   timer(3000)
   timer(3)
   limpatela
   mostraposicao()

fimescolha


fimprocedimento
procedimento mostraposicao()      // Mostra o evento da posição atual
inicio
randItem <- randi(3)+5
se zona[posicao[0],posicao[1]]=0  entao
   se vidaGarra <> 0 entao
      escreval(mapa[posicao[0],posicao[1]])
      comandoposicao()
   senao
      limpatela
      escreval(" Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!")
      timer(5500)
      timer(2)
      sair()
   fimse
senao
   escreval(mapainimigo[randTipoInimigo],tipoinimigo[randTipoInimigo],inimigoAtaque[randInimigoAtaque],", qual sua próxima ação Inspetor Bugiganga?")
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
escreval(" Jogo desenvolvido pela Equipe TeamPanzé, cujos membros são")
escreval(" alunos da Instituição de Ensino FAPAN")
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
escreval(" - Você como Inspetor Bugiganga, pode caminhar pela Cidade ")
escreval(" Utilize os numeradores 1, 2, 3 e 4 para determinar a direção ")
escreval(" o qual irá seguir ")
escreval(" - Haverá vários obstáculos e inimigos durante sua jornada ")
escreval(" Sua lista de itens e utilitários ajudarão a derrotar quem ")
escreval(" o confronte, e a superar desafios. ")
escreval(" - Seu objetivo final é descobrir o responsável pelo ")
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
escreval("Digite uma opção válida!")
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
escreval("                      (2) Ver Instruções")
escreval("                      (3) Créditos")
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
escreval("                   Digite uma opção válida!")
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
posicao[0] <- 6    // Posição inicial Eixo X
posicao[1] <- 3    // Posição inicial Eixo Y
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
escreval("                      TeamPanzé Apresenta:")

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

// Descrição dos pontos do Mapa (NARRATIVA)

mapa[6,1] <- " Garagem da sua Central de Operações Bugiganga, os veículos usados contra o Sobrinho de um certo alguém estão aqui."
mapa[6,2] <- " Você está na sua Sede de Operações Bugiganga, aqui há armas Lasers Bugiganga, Protocólos Bugiganga de Defesa e Ataque, porém nenhum recurso está disponível, há suspeita que a Central de Comunicações está danificada."
mapa[6,3] <- " Você Inspetor Bugiganga, está detectando um crescimento descontrolado da criminalidade, sua missão é desvender o motivo por trás desse ocorrido, e combater o crime na cidade com suas Bugigangas. Digite qual direção inicial você irá embarcar nessa aventura:"
mapa[6,4] <- " Neste ponto há um beco vizinho a sua casa Bugiganga, e diversas lembranças com sua sobrinha Penny, antes da sua operação médica, que o tornou o que você é."
mapa[6,5] <- " Está no final do seu bairro, bem longe do perigo, porém distante da Torre de Vigilância a frente da sua casa."
mapa[5,1] <- " Há destroços espalhados por aqui, muito semelhante a Estragos feitos por seu Antagonista Principal, nesse ponto não dá para duvidar de mais nada."
mapa[5,2] <- " Ponto de Ônibus no local, ainda com bastante criminosos a frente, talvez seja bom se preparar para Combater alguns."
mapa[5,3] <- " Daqui é possível ver muito a frente uma torre de vigilância a qual não estava ali antes, talvez seja uma base de criminosos comandada por uma força maior, além disso a apenas alguns metros de você há um grupo de Foras da Lei, cuidado."
mapa[5,4] <- " Aqui parece ser o Lugar que você escorregou n'uma banana, e por conta disso, teve o corpo reconstruído de Bugigangas. Você está próximo de um grupo nesse momento."
mapa[5,5] <- " Há uma Delegacia da polícia a sua frente, é justo a qual você trabalhava inicialmente, siga em FRENTE"
mapa[4,1] <- " Seu objetivo está cada vez mais próximo, o cuidado para usar a melhor estratégia em combate ainda é válida."
mapa[4,2] <- " Aqui pelo jeito, é a região de maior concentração dos crimes de horda desses criminosos, justo o centro da cidade..."
mapa[4,3] <- " Está no principal atrativo da cidade, ponto com uma praça e diversas bancas com lanchonetes e sorveterias diversas."
mapa[4,4] <- " Aqui pelo jeito, é a região de maior concentração dos crimes de horda desses criminosos, justo o centro da cidade..."
mapa[4,5] <- " É possível ver uma ponte daqui, "
mapa[3,1] <- " Há um padrão de crimes no mapa da cidade, que formam 3 letras, provavelmente quem arquitetou tudo isso bolou alguma estratégia"
mapa[3,2] <- " Você está no início do jogo"
mapa[3,3] <- " Você está no início do jogo"
mapa[3,4] <- " Você está no início do jogo"
mapa[3,5] <- " Você está no início do jogo"
mapa[2,1] <- " Você está no início do jogo"
mapa[2,2] <- " Você está no início do jogo"
mapa[2,3] <- " Você está no início do jogo"
mapa[2,4] <- " Você está no início do jogo"
mapa[2,5] <- " Você está no início do jogo"
mapa[1,1] <- " Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!"
mapa[1,2] <- " Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!"
mapa[1,3] <- " Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!"
mapa[1,4] <- " Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!"
mapa[1,5] <- " Você finalmente derrotou o Dr. Garra, livrando assim a cidade do caos criminoso e restabelecendo a ordem na mesma, PARABÉNS pela finalizanção da trama do inspetor bugiganga!"

mapaitem[5] <- "               Você encontrou um Óculos Escuro"
mapaitem[6] <- "                   Você encontrou uma Lupa"
mapaitem[7] <- "                 Você encontrou uma Lanterna"
mapaitem[8] <- "                 Você encontrou uma Pistola"

// Tipos de Inimigos

tipoinimigo[0] <- "Crimioso"
tipoinimigo[1] <- "Chefe do Crime"
tipoinimigo[2] <- "Cafetão"
tipoinimigo[3] <- "Bandido"

// Variações de ataques dos Inimigos

inimigoAtaque[0] <- " ele está Sacando uma pistola e preparando para atirar em sua direção"
inimigoAtaque[1] <- " ele pegou um lança-chamas e está acionando a arma pra queima-lo"
inimigoAtaque[2] <- " Com uma roupa tecnológica, a qual emite ondas sonoras de alta frequência, danificando a audição do seu alvo, ele está em prontidão para efetuar esse ataque contra você!"
inimigoAtaque[3] <- " almejando o Combate corpo a corpo, indo em sua direção na maior velocidade possível"
inimigoAtaque[4] <- " o qual está pegando uma Lanterna na tentativa de dispersar sua visão"
inimigoAtaque[5] <- " ele está sobrevoando os céus com um helicóptero de combate, manejando o mesmo para iniciar um ataque sobre você"
inimigoAtaque[6] <- " emitindo um raio ultravioleta de altíssima intensidade para disparar na sua direção"
inimigoAtaque[7] <- " empunhando uma faca para lhe acertar"

vidaGarra <- 3 // HP do Chefão ( Dr. Garra )

timer(2)
fimprocedimento

// 1 - Colete a Prova de Balas
// 2 - Jato de água
// 3 - Abafadores Sonoros
// 4 - Chapéu Bugiganga
// 5 - Óculos Escuro
// 6 - Lupa
// 7 - Lanterna
// 8 - Pistola

// Vidas, Inventário, Andar pelo Cenário com Narrativa
// Interação com Objetos

reset() // Reset de Dados
menu() // JOGO


fimalgoritmo

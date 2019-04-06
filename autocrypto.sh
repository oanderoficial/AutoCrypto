#!/usr/bin/env bash

#Acesso ROOT.

[ $UID -ne '0' ] && { echo "Necessário ter Acesso ROOT."; exit 1 ;}


export LANG=C.UTF-8

blue='\e[0;34m'
green='\e[1;32m'
Cyan="\033[0;36m"
white='\e[1;37m'
BlueF='\e[1;34m'
yellow="\033[1;33m"

echo -e "$blue"

        cat <<logo

                    ╔═╗┬ ┬┌┬┐┌─┐╔═╗┬─┐┬ ┬┌─┐┌┬┐┌─┐
                    ╠═╣│ │ │ │ │║  ├┬┘└┬┘├─┘ │ │ │
                    ╩ ╩└─┘ ┴ └─┘╚═╝┴└─ ┴ ┴   ┴ └─┘

                        By Anderson.b.Silva

logo

menu()
{
   echo -e "\t\t\t $Cyan Client for GnuPG\n"
   echo -e "\t$yellow[1] $Cyan[$green Criptografar um Arquivo com cifra simétrica       $Cyan] $white: "
   echo -e "\t$yellow[2] $Cyan[$green Criptografar um Arquivo com o padrão AES-128      $Cyan] $white: "
   echo -e "\t$yellow[3] $Cyan[$green Descriptografar Um Arquivo                        $Cyan] $white: "
   echo -e "\t$yellow[4] $Cyan[$green Gerar um conjunto de chaves pública e privada     $Cyan] $white: "
   echo -e "\t$yellow[5] $Cyan[$green Listar suas chaves Existentes                     $Cyan] $white: "
   echo -e "\t$yellow[6] $Cyan[$green Instalar o Gnupg                                  $Cyan] $white: "
   echo -e "\t$yellow[7] $Cyan[$green Sair                                              $Cyan] $white: "
   echo -e "\t$BlueF Escolha uma Opção [1/2/3/4/5/6/7]?"
   echo -e "$white"
   echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
   read menu2

case $menu2 in
  1) cripto;;
  2) cripto2;;
  3) descripto;;
  4) chaves;;
  5) existentes;;
  6) Instale;;
  7) sair;;
  *) echo -e $yellow'opicão invalida, tente novamente!'&&sleep 2&&menu;;
esac
}
echo -e "$white"

function cripto () {
   echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
   echo -e "$yellow Qual o Arquivo que Deseja Criptografar?:$white\n"
   read cripto
   echo `gpg -c $cripto`
   clear
   echo -e "$yellow[>] $green O Arquivo:$yellow $cripto $green foi Criptografado com Sucesso!"
   echo -e "$yellow[>] $BlueF Para Descriptografar Opção: $yellow [2]"
}

function cripto2 () {
  echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
  echo -e "$yellow Qual o Arquivo que Deseja Criptografar?:$white\n"
  read cripto2
  echo `gpg --cipher-algo AES256 --symmetric $cripto2`
   clear
   echo -e "$yellow[>] $green O Arquivo:$yellow $cripto2 $green foi Criptografado com Sucesso!"
   echo -e "$yellow[>] $BlueF Para Descriptografar Opção: $yellow [3]"
}

function descripto () {
  echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
  echo -e "$yellow Qual o Arquivo que Deseja Descriptografar?:$white\n"
  read descripto
  echo `gpg --decrypt-files $descripto`
   clear
   echo -e "$yellow[>] $green O Arquivo:$yellow $descripto $green foi Descriptografado com Sucesso!"
}

function chaves () {
   echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
   echo -e $yellow "Precione [ENTER]"
   read chaves
   clear
   echo -e `gpg --gen-key`
}

function existentes () {
  echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
  echo -e "$yellow Precione [ENTER]:$white\n"
  read existentes
  echo `gpg --list-keys`
   clear
}

function Instale () {
  echo -n -e $blue'  \t AutoCrypto:\033[0m >> '; tput sgr0
  echo -e "$yellow Precione [ENTER]:$white\n"
  read Instale
  echo `apt install gnupg`
   clear
 }

function sair()
{
   echo -e "$yellow\tPressione [Enter] para Sair .............."&&read&&exit 0
}
menu

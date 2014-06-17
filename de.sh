#!/usr/bin/env bash
clear;

TAILLE=6
NBRE=1

run_de()
{
	for((i=0;i<20;i++)); do
		printf "\033[0K\033[16G%02d" $(($RANDOM%$TAILLE));
		sleep 0.05;
	done
	printf "\033[2K\033[1G";
	for((i=0;i<$NBRE;i++)); do
		printf "%02d\t" $((1+$RANDOM%$TAILLE));
	done
}

while [ 1 ]; do
	echo -n "Taille des dés :"; read TAILLE;
	echo -n "Nombre de dés :"; read NBRE;
	val=" ";
	while [ "$val" != "d" ]; do
		run_de;
		read -sn 1 val;
		printf "\n$(head -c $(tput cols) /dev/zero|tr "\0" "-")\n"
	done
done

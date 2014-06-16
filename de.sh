#!/usr/bin/env bash
clear;

TAILLE=6
NBRE=1

run_de()
{
#	printf "Tirage de dé…";
#	for((i=0;i<20;i++)); do
#		printf "[0K[16G%02d" $(($RANDOM%$TAILLE));
#		sleep 0.05;
#	done
#	printf "[2K[1G";
	for((i=0;i<$NBRE;i++)); do
		printf "%02d\t" $((1+$RANDOM%$TAILLE));
	done
}

while [ 1 ]; do
	echo -n "taille:"; read TAILLE;
	echo -n "nombre de dés:"; read NBRE;
	val=" ";
	while [ "$val" != "d" ]; do
		run_de;
		read -sn 1 val;
		printf "\n$(head -c $(tput cols) /dev/zero|tr "\0" "-")\n"
	done
done

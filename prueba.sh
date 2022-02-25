#!/usr/bin/env bash
#Este programa es desarrollado por Hackart
password=1234
function vuln {
	clear
	figlet -f slant Eternal Blue
	echo "Analizar toda la red o Ip Especifica"
	echo "1.- Toda la red"
	echo "2.- Ip Especefica"
	read -p ">> " red
	if [ $red == "1" ]; then
		echo "Segmentacion a usar"
		read -p "Segmento >> " seg
		nmap -p 445 --script smb-vuln-ms17-010 192.168.$seg.1/24
	elif [ $red == "2" ]; then  
		echo "Ip a analizar"
		read -p "IP >> " ip
		nmap -p 445 --script smb-vuln-ms17-010 $ip
	else
		echo "La opcion seleccionada es incorrecta"
	fi
}
clear
echo "Digital tu Password para iniciar sesion"
read -s -p  "Conatraseña: " pass
echo "validando informacion"
if [ $pass = $password ]; then
	clear
	echo "Escaneo de la RED"
	echo "Elige la opcion deseada"
	echo "1.- Escaneo Simple de toda la red"
	echo "2.- Escaneo de Servicios"
	echo "3.- Reconocimiento de SO"
	echo "4.- Escaneo de Vulnerabilidades"
	echo "5.- Salir"
	read -p ">> " opt
	case $opt in
		1)
			clear
			figlet -f slant Escaneo
			echo "Escaneo simple de la red"
			echo "Segmento a escanear"
			read -p "Segmento >> " seg
			nmap 192.168.$seg.1/24
			;;
		2)
			clear
			figlet -f bubble Servicios
			echo "Escaneo de Servicios"
			echo "Digita la direccion Ip"
			read -p "IP >> " IP
			nmap -sV $IP
			;;
		3)
			clear
			echo "Reconocimiento de SO"
			echo "Digita la IP a anailizar"
			read -p "IP >> " IP
			nmap -O $IP
			;;
		4)
			vuln
			;;
		5)
			figlet -f slant SALIENDO
			;;
	esac


else
	echo "Password es incorrecto"
	exit
fi

import 'dart:io';

void main() {
  
  print("Entrez l'heure : ");
  int heure = int.parse(stdin.readLineSync()!);
  print("Entrez les minutes : ");
  int minutes = int.parse(stdin.readLineSync()!);
  print("Entrez les secondes : ");
  int secondes = int.parse(stdin.readLineSync()!);
  secondes += 1;

  if (secondes == 60) {
    secondes = 0;
    minutes += 1;

    if (minutes == 60) {
      minutes = 0;
      heure += 1;

      if (heure == 24) {
        heure = 0;
      }
    }
  }

  print("Dans une seconde, il sera ${heure.toString().padLeft(2, '0')}h${minutes.toString().padLeft(2, '0')} et $secondes secondes.");


    print("Entrez le nombre de photocopies effectuées : ");
  int nombrePhotocopies = int.parse(stdin.readLineSync()!);

  
  double facture = 0.0;

  if (nombrePhotocopies <= 10) {
    facture = nombrePhotocopies * 0.10;
  } else if (nombrePhotocopies <= 30) {
    facture = 10 * 0.10 + (nombrePhotocopies - 10) * 0.09;
  } else {
    facture = 10 * 0.10 + 20 * 0.09 + (nombrePhotocopies - 30) * 0.08;
  }


  print("La facture pour $nombrePhotocopies photocopies est de ${facture.toStringAsFixed(2)} euros.");


  print("Entrez votre âge : ");
  int age = int.parse(stdin.readLineSync()!);


  print("Entrez votre sexe (M pour homme, F pour femme) : ");
  String sexe = stdin.readLineSync()!.toUpperCase();

  bool estImposable = false;

  if ((sexe == 'M' && age > 20) || (sexe == 'F' && age >= 18 && age <= 35)) {
    estImposable = true;
  }

  // Afficher le résultat
  if (estImposable) {
    print("Vous êtes imposable.");
  } else {
    print("Vous n'êtes pas imposable.");
  }
}
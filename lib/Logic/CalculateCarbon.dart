
String calculate(people,energy,gas,cars,milage){
  print(people);
  print(energy);
  print(gas);
  print(cars);
  print(milage);
  double coelectric =0;
  double cogas=0;
  double cocar=0;
  int electricity =int.parse(energy);
  int peop =int.parse(people);
  int gasUse=int.parse(gas);
  int noOfCars=int.parse(cars);
  int milageFinal=int.parse(milage);

  double ans=0;

  if(electricity<=2000){
    coelectric=0.62;
  }else if(electricity>2000 && electricity<=3000){
    coelectric=0.93;
  }else if(electricity>3000 && electricity<=4800){
    coelectric=1.48;
  }else{
    coelectric=2.16;
  }

  if(gasUse<=5000){
    cogas=1.01;
  }else if(gasUse>5000 && gasUse<=12000){
    cogas=2.44;
  }else if(gasUse>12000 && gasUse<=18000){
    cogas=3.65;
  }else{
    cogas=5.48;
  }  

  if(milageFinal<=35){
    cocar= 2.45;
  }else if(milageFinal>35 && milageFinal<=46){
    cocar=1.87;
  }else if(milageFinal>46 && milageFinal<=52){
    cocar=1.65;
  }else{
    cocar =1.65;
  }


  ans=(ans+coelectric+cogas+(cocar*noOfCars) + 1.1)/(peop-1);
  print(ans);
  return ans.toString();
}
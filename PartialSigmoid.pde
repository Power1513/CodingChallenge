/* A piecewise Function composed of 2 sigmoid functions used to how many fireworks are going to be in each layer*/
float PartSigmoid(float x){
  if(x == 0){
    return 1; 
  }
  else if(x<HALF_PI){
    return -1/(1+exp(-7*(x-PI/3)))+1;
  }
  else{
    return -1/(1+exp(-50*(x-PI/3)))+1;
  }
  
}

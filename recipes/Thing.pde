class Thing {
  Word[] inputs; 
  Word[] outputs; 
  
  Word name; 
  
  boolean isSelected; 
    
  Thing (String n, String[]in, String[] out) {
  
  name = new Word(n);   
  inputs = new Word[in.length]; 
  outputs = new Word [out.length]; 

  for (int i = 0; i < in.length; i++) {
    inputs[i] = new Word(in[i]); 
  }
  
  for (int i = 0; i < out.length; i++) {
    outputs[i] = new Word(out[i]); 
  }

  }
  
  
  //make constructor versions for no in, no out
}

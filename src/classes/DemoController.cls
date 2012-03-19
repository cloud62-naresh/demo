public class DemoController{

public String out{
get{
if(out==null) out= 'getter';
return out;
}
set;
}



public DemoController(){
out = 'Constructor';
}
public void setOut(){
out = 'action';
}
}
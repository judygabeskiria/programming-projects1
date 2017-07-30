import tester.*; 

public class Lecture2b { 
  public static Examples E = new Examples(); 
  public static void main(String [] args){ 
    Tester.run(E); 
  }
  
}

class Examples { 
  Examples() {}
  
  
  CartPt a1 = new CartPt(20, 40); 
  CartPt a2 = new CartPt(40, 30);
  Dot dot1 = new Dot(a1); 
  Dot dot2 = new Dot(a2);
  IShape square1 = new Square(a1, 20); 
  IShape circle1 = new Circle(a2, 15); 
  IShape circle2= new Circle(a1, 14);
  
  
  void testDistTo0(Tester t) { 
     t.checkExpect(a1.distTo0(), Math.sqrt(20) * 10); 
     t.checkExpect(a2.distTo0(), 50.0); 
     t.checkExpect(dot1.distTo0(), Math.sqrt(20) * 10);
     t.checkExpect(dot2.distTo0(), 50.0);
     
     t.checkExpect(square1.distTo0(), Math.sqrt(20) * 10);
     t.checkExpect(circle1.distTo0(), 35.0);
    
  }
  void testSame(Tester t)
  {
    t.checkExpect( dot1.same(dot2, 0.01), true); 
    t.checkExpect( square1.same(dot1, 0.01), false);
  }
  void testCloserTo(Tester t)
  {
    t.checkExpect(dot1.closerTo(dot2), true);
    t.checkExpect(dot1.closerTo(square1), false);
    t.checkExpect(circle1.closerTo(square1), true);
  }
  
} 

class CartPt{ 
  double x; 
  double y ; 
  CartPt(double x, double y ) { 
    this.x = x; 
    this.y = y ; }
  double distTo0(){ 
    return Math.sqrt(this.x * this.x + this.y * this.y ); 
  }
  
}
interface IShape { 
  double distTo0();
  boolean same(IShape other, double delta);
  boolean closerTo(IShape other);
}
abstract class AShape implements IShape { 
  CartPt loc; 
  AShape(CartPt loc) { 
    this.loc = loc ; 
  }
  public double distTo0(){
     return this.loc.distTo0();
  }
  abstract public double area();
  public boolean same(ISHape other, double delta){
    
    return Math.abs(this.area()-other.area()) < delta;
    
  }
  public boolean closerTo(IShape other)
  {
    return this.distTo0() < other.distTo0();
  }
}

class Dot implements IShape{ 
  CartPt loc; 
  Dot(CartPt loc) { 
    this.loc = loc ; 
  } 
  public double distTo0(){ 
    return this.loc.distTo0();
  }
  public boolean same(IShape other, double delta)
  {}
}

class Square implements IShape{
  CartPt loc; 
  int size; 
  Square(CartPt loc, int size) { 
    this.loc = loc ; 
  } 
   public double distTo0(){ 
    return this.loc.distTo0();
  }
}

class Circle implements IShape{ 
  CartPt loc; 
  int radius;
  Circle(CartPt loc, int radius) { 
    this.loc = loc ; 
    this.radius = radius;
  } 
   public double distTo0(){ 
    return this.loc.distTo0() - this.radius;
  }
}
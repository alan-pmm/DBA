package Java_objects_tuto;

public class This_B {
	private int classvariable = 88; 
	private int othervariable = 77;
	public static void main(String args[]) { 
		This_B obj = new This_B(); 
	
		obj.method(20,45); 
			obj.method(); 
		} 
	 
		private void method(int variable, int classvariable) { 
			variable = 10; 
			
		System.out.println("Value of Instance variable :" + this.classvariable); // WE TAKE THE RESULT OF THE VARIABLE FROM THE CLASS
		System.out.println("Value of other variable :" + this.othervariable); 
		System.out.println("Value of Instance variable :" + variable); 
		System.out.println("Value of Local variable :" + variable); 
	} 
	
		void method() { 
			int variable = 40; 
		System.out.println("Value of Instance variable :" + this.classvariable); 
		System.out.println("Value of Instance other variable :" + this.othervariable); 
		System.out.println("Value of Local variable :" + variable); 
	} 

}

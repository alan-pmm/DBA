package A_Packet;




public class C_tableau {

	static char tableauCaractere[] = {'a','b','c','d','e','f','g'};	
	
	public static void main(String[] args) {
		
	for(int i = 0; i < tableauCaractere.length; i= i + 2)
	{
	  System.out.println("À l'emplacement " + i +" du tableau nous avons = " + tableauCaractere[i]);
	  System.out.println(tableauCaractere[3]);
	}
	}
}



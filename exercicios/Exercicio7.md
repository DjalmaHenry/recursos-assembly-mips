<div>
	<p>Explicação:</p>
	<p>Se o valor de $a1 for par, múltiplo de 15 e maior ou igual a 82, os valores de $v0 e $v1 retornam 0. Ao contrário,o programa apresenta erro, pois o valor de retorno é 	     tão grande que o registrador não suporta salva-lo.</p>
</div>

##
<div>
	<p>Interpretação do código:</p>

	$t2 = 82
	$s0 = -10
	$t0 = 0
	$t1 = 1
	$t4 = 0
	$s1 = 15

	Se a1 é par - retorna 0
	Se a1 é maior ou igual a 82 - retorna 0

	Loop:
		Se n == $s1(15), Termina
		$t0 = $t0(0) + $s1(15)
		$s1 = $s1(15) + 15
		$t4 = $t4(0) + 1
		volta Loop.

	Termina:
		retorna $t0 e $t4
</div>

##
<div>
	<p>Código em Java:</p>
	
	package exercicio7;

	public class exercicio7 {

   	 public static void main(String[] args) {
    	        int t0 = proc1(30);
   	        int t4 = proc2(30);
  	        System.out.println("$t0: " + t0);
 	        System.out.println("$t4: " + t4);
	 }

     public static int proc1(int a1) {
       	int t2 = 82;
       	int s0 = -10;
       	int t0 = 0;
       	int t1 = 1;
       	int t4 = 0;
       	int s1 = 15;
       	if (a1 % 2 == 0) { // se a1 é par
       	    return t0; //retorna 0
       	}
       	if (a1 >= t2) { //se a1 >= 82
            return t0; //retorna 0
       	}
        while (a1 != s1) {
            t0 = t0 + s1;
           s1 = s1 + 15;
            t4 = t4 + 1;
       	}
     	    return t0;
  	}

    public static int proc2(int a1) {
        int t2 = 82;
        int s0 = -10;
        int t0 = 0;
        int t1 = 1;
        int t4 = 0;
        int s1 = 15;
        if (a1 % 2 == 0) { // se a1 é par
            return t4; //retorna 0
        }
        if (a1 >= t2) { //se a1 >= 82
            return t4; //retorna 0
        }
        while (a1 != s1) {
            t0 = t0 + s1;
            s1 = s1 + 15;
            t4 = t4 + 1;
        }
        return t4;
      }
    }

</div>

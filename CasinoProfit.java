import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
//n-number of sections on spinning wheel
//x money invested
//m number of people
//w and p- money that winner gets and probility of that section
public class Solution {
public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int x = in.nextInt();
        int m = in.nextInt();
        int arrw[]= new int[n];
        int arrp[]=new int[n];
        float profit=0;
        
        for(int a0 = 0; a0 < n; a0++){
            arrw[a0] = in.nextInt();
            arrp[a0] = in.nextInt();
           // profit=profit+(arrp[a0]/100)*(x-arrw[a0]);
        }
        //profit=profit*m;
        
        in.close();
       for (int i=0;i<n;i++)
       {
          profit=profit+((x-arrw[i])*arrp[i])/100;
       }
       profit=profit*m;
        System.out.println(profit);
    }
}

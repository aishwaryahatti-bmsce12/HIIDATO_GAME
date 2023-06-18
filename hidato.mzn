% hidato puzzle
int: n; % no of ROWS
set of int: ROW = 1..n;
int: m; % no of COLS
set of int: COL = 1..m;

set of int: CLUE = 0..m*n;
array[ROW,COL] of CLUE: clue;

set of int: NUM = 1..m*n;
array[ROW,COL] of var NUM: x;
  
%% output for debugging                
int: d = ceil(log10(m*n+1));
output [ show_int(d,x[r,c]) ++ " " ++ if c = m then "\n" else "" endif
       | r in ROW, c in COL ];       
include "alldifferent.mzn";
constraint alldifferent(array1d(x));
constraint forall(r in ROW,c in COL)
             (if clue[r,c]>0 then x[r,c]=clue[r,c] endif);
set of int: POS=1..m*n;%(1,1)=1(1,m)=m(2,1)=m+1
array[NUM] of var POS : y ;
include "inverse.mzn";
constraint inverse(array1d(x),y);
constraint forall(n in 1..n*m-1)
           (adjacent(y[n],y[n+1]));
predicate adjacent(var POS:p1,var POS:p2)=
          let{var ROW: r1=(p1-1)div m+1;
              var COL: c1=(p1-1)mod m+1;
              var ROW: r2=(p2-1)div m+1;
              var COL: c2=(p2-1)mod m+1;} in
          abs(r1-r2)<=1/\abs(c1-c2)<=1;
          
          


           

             
             
             
             
             
             
             
             
             
             
             
             
             
    

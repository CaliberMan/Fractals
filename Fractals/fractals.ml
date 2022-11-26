# load "graphics.cma" ;;
open Graphics ;;
open_graph " 1200x800";;

(*LINE*)

let draw_line (x, y) (z, t) = 
moveto x y;
lineto z t;;

(*MOUNTAIN*)

let rec mountain n (x, y) (z, t) = 
set_color black;
if n = 0 then draw_line (x, y)(z, t)
else 
  let m = (x+z)/2 and h = (y+t)/2 + Random.int(abs(z-x)/5 + 20) in
    mountain (n-1) (x, y) (m, h);
    mountain (n-1) (m, h) (z, t);;

(*DRAGON*)

let dragon n (x, y) (z, t) =
set_color black;
begin
  if n = 0 then draw_line (x, y) (z, t)
  else
  let u = (x+z)/2 + (t-y)/2 and v = (y+t)/2 - (z-x)/2 in
  dragon (n-1)(x, y)(u, v);
  dragon (n-1) (z, t) (u, v)
end;;

(*SPONGE*)

let draw_sponge (x, y) n = 
if n < 0 then invalid_arg "N is less than O"
else
  set_color black;
  fill_rect x y n n;
  let rec aux (x, y) n r =
    set_color white;
    let s = n/3 in match r with
      1 -> fill_rect (x+s) (y+s) s s;
      |_ -> aux (x, y) s (r-1);
            aux (x+s, y) s (r-1);
            aux (x+2*s, y) s (r-1);
            aux (x, y+s) s (r-1);
            aux (x+2*s, y+s) s (r-1);
            aux (x, y+2*s) s (r-1);
            aux (x+s,y+2*s) s (r-1);
            aux (x+2*s, y+2*s) s (r-1);
            fill_rect (x+s) (y+s) s s;

in aux (x, y) n 6;;

let sponge (x, y) n =
  clear_graph ();
  moveto x y ;
  draw_sponge(x, y) n ;;

(*TRIANGLE*)

let equi (x, y) n =
let x1 = float_of_int(x) and y1 = float_of_int(y) and n1 = float_of_int(n) in
let u = int_of_float(x1+. (n1/.2.)) and v = int_of_float(y1 +. sqrt(3.)/.2. *. n1) and z = int_of_float(x1 +. n1) in
moveto x y;
lineto u v;
lineto z y;
lineto x y;;

(*Round*)
let round n = floor(n+.0.5);;

(*Work Function*)
let sierpinski (x, y) n r =
set_color black;
let rec aux (x, y) n r =
let s = n/2 and y1 = float_of_int(y) and x1 = float_of_int(x)and s1 = float_of_int(n)/.2. in 
let a = int_of_float(round (x1+.(s1/.2.))) and b = int_of_float(round((y1)+. sqrt(3.)/.2.*.s1))and c = int_of_float(round(x1+.s1)) in

match r with
0 -> equi (x, y) n;
|_-> aux (x, y) (s) (r-1);
aux (a, b) (s) (r-1);
aux (c, y) (s) (r-1);
equi (x, y) n
in aux (x, y) n r;;

(*Calling Function*)
let triangle (x, y) n r =
clear_graph();
sierpinski (x, y) n r;;
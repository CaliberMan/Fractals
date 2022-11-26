et rec build_line n s =
  match n with 
    0 -> ""
  |_ when n < 0 -> invalid_arg "n is less than zero"
  |_ -> s ^ build_line (n-1) s ;;

let square num s =
  let rec build_line n s =
    match n with 
      0 -> ""
    |_ when n < 0 -> invalid_arg "n is less than zero"
    |_ -> s ^ build_line (n-1) s
  in
  let chungus num s = 
    let rec aux1 num s l =
      match l with 
        p when p = num -> print_string("")
      |_ -> print_string(build_line num s); 
          print_newline(); 
          aux1 num s (l+1)
    in aux1 num s 0
  in chungus num s ;;

let square2 n (a, b) = 
  let m = a^b in
  let rec build_line n s =
    match n with 
      0 -> ""
    |_ when n < 0 -> invalid_arg "n is less than zero"
    |_ -> s ^ build_line (n-1) s
  in
  let rec shaggy n m e = 
    match e with
      e when e = n -> ()
    |_ when e mod 2 = 0 -> let m = a^b in print_string(build_line n m);
        print_newline(); shaggy n m (e+1)
    |_ -> let m = b^a in print_string(build_line n m); 
        print_newline(); shaggy n m (e+1)
  in shaggy n m 0 ;;

let triangle n s = 
  let rec build_line n s =
    match n with 
      0 -> ""
    |_ when n < 0 -> invalid_arg "n is less than zero"
    |_ -> s ^ build_line (n-1) s
  in
  let rec yoda n s l = 
    match l with 
      _ when n = 0 -> print_string("")
    |_ when l = n -> print_string(build_line l s)
    |_ -> print_string(build_line l s); print_newline(); yoda n s (l+1)
  in yoda n s 1 ;;

let pyramid num (a, b) = 
  let rec shrek a1 b1 =
    match b1 with
      _ when b1 = 2*num -> print_string(build_line b1 b)
    |_ -> print_string(build_line a1 a); 
        print_string(build_line b1 b);
        print_string(build_line a1 a); 
        print_newline(); 
        shrek (a1-1) (b1+2) 
  in shrek (num-1) (2) ;;
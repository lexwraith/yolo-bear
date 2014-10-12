Printf.fprintf stdout "Howdy %s\n" "Mike";;

let prompt_and_process = Printf.fprintf stdout "Enter your calculation:\n%s" (read_line ());; 

while true do (prompt_and_process ()) done;;





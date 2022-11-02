[top]
components : prisonersdilemma

[prisonersdilemma]
type : cell
width : 45
height : 45
delay : transport
defaultDelayTime : 100
border : wrapped 
neighbors : prisonersdilemma(-1,1) prisonersdilemma(0,1) prisonersdilemma(1,1)
neighbors : prisonersdilemma(-1,0) prisonersdilemma(0,0) prisonersdilemma(1,0)
neighbors : prisonersdilemma(-1,-1) prisonersdilemma(0,-1) prisonersdilemma(1,-1)
initialvalue : 0
initialrowvalue :  21    000000000000000000000111000000000000000000000
initialrowvalue :  22    000000000000000000000151000000000000000000000
initialrowvalue :  23    000000000000000000000111000000000000000000000 
localtransition : prisonersdilemma-rule
neighborports : state stage cState totalPayoff


[prisonersdilemma-rule]	

% Comment: This is used to initialize the game

rule : { ~stage := 1; ~cState := 1; ~state := 11; ~totalPayoff := 0; } 100 { (0,0)~state = 0 }
rule : { ~stage := 1; ~cState := 2; ~state := 21; ~totalPayoff := 0; } 100 { (0,0)~state = 1 }
rule : { ~stage := 1; ~cState := 2; ~state := 22; ~totalPayoff := 0; } 100 { (0,0)~state = 5 }
                                                                
			 				 
% Comment: This is used to calculate the total payoff between a prisoner and its 9 neighbour in the Moore Neighbourhood (including itself). 

rule : {  ~stage := 2; ~state := (0,0)~state; ~totalPayoff := 

				(	if  ((0,0)~cState = 1 and (0,0)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (0,0)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (0,0)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (0,0)~cState = 2, 0, 0) +

					if  ((0,0)~cState = 1 and (1,0)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (1,0)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (1,0)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (1,0)~cState = 2, 0, 0) +
	
					if	((0,0)~cState = 1 and (1,1)~cState = 1, 1, 0) +
					if	((0,0)~cState = 1 and (1,1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (1,1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (1,1)~cState = 2, 0, 0) +
				
					if	((0,0)~cState = 1 and (0,1)~cState = 1, 1, 0) +
					if	((0,0)~cState = 1 and (0,1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (0,1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (0,1)~cState = 2, 0, 0) +		
				
					if	((0,0)~cState = 1 and (-1,1)~cState = 1, 1, 0) +
					if	((0,0)~cState = 1 and (-1,1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (-1,1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (-1,1)~cState = 2, 0, 0) +
					
					if  ((0,0)~cState = 1 and (-1,0)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (-1,0)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (-1,0)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (-1,0)~cState = 2, 0, 0) +
					
					if  ((0,0)~cState = 1 and (-1,-1)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (-1,-1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (-1,-1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (-1,-1)~cState = 2, 0, 0) +
					
					if  ((0,0)~cState = 1 and (0,-1)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (0,-1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (0,-1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (0,-1)~cState = 2, 0, 0) +
					
					if  ((0,0)~cState = 1 and (1,-1)~cState = 1, 1, 0) +
				  if	((0,0)~cState = 1 and (1,-1)~cState = 2, 0, 0) +
					if	((0,0)~cState = 2 and (1,-1)~cState = 1, 1.25, 0) +
					if	((0,0)~cState = 2 and (1,-1)~cState = 2, 0, 0)
					);
			 }	
			 
			 				 100 { (0,0)~stage = 1 }		
			 				 
% Comment: Each individual cell will compare its total payoff value between itself and its neigbour in the Moore Neigbourhood and will change stratergy
%					 to the most successful

rule : { ~stage := 1; ~state := (((0,0)~cState * 10) + (0,0)~cState); ~cState := (0,0)~cState; ~totalPayoff := 0; } 

								100 {(0,0)~totalPayoff >= (1,0)~totalPayoff and 
										 (0,0)~totalPayoff >= (1,1)~totalPayoff and
										 (0,0)~totalPayoff >= (0,1)~totalPayoff and
										 (0,0)~totalPayoff >= (-1,1)~totalPayoff and
										 (0,0)~totalPayoff >= (-1,0)~totalPayoff and
										 (0,0)~totalPayoff >= (-1,-1)~totalPayoff and
										 (0,0)~totalPayoff >= (0,-1)~totalPayoff and
										 (0,0)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }
																														
rule : { ~stage := 1; ~state := (((1,0)~cState * 10) + (0,0)~cState); ~cState := (1,0)~cState; ~totalPayoff := 0; } 		
				
							100 {  (1,0)~totalPayoff >= (0,0)~totalPayoff and 
										 (1,0)~totalPayoff >= (1,1)~totalPayoff and
										 (1,0)~totalPayoff >= (0,1)~totalPayoff and
										 (1,0)~totalPayoff >= (-1,1)~totalPayoff and
										 (1,0)~totalPayoff >= (-1,0)~totalPayoff and
										 (1,0)~totalPayoff >= (-1,-1)~totalPayoff and
										 (1,0)~totalPayoff >= (0,-1)~totalPayoff and
										 (1,0)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }
									
rule : { ~stage := 1; ~state := (((1,1)~cState * 10) + (0,0)~cState); ~cState := (1,1)~cState; ~totalPayoff := 0; }	
				
							100 {  (1,1)~totalPayoff >= (0,0)~totalPayoff and 
										 (1,1)~totalPayoff >= (1,0)~totalPayoff and
										 (1,1)~totalPayoff >= (0,1)~totalPayoff and
										 (1,1)~totalPayoff >= (-1,1)~totalPayoff and
										 (1,1)~totalPayoff >= (-1,0)~totalPayoff and
										 (1,1)~totalPayoff >= (-1,-1)~totalPayoff and
										 (1,1)~totalPayoff >= (0,-1)~totalPayoff and
										 (1,1)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }
									 
rule : { ~stage := 1; ~state := (((0,1)~cState * 10) + (0,0)~cState); ~cState := (0,1)~cState; ~totalPayoff := 0; }			
				
							100 {  (0,1)~totalPayoff >= (0,0)~totalPayoff and 
										 (0,1)~totalPayoff >= (1,0)~totalPayoff and
										 (0,1)~totalPayoff >= (1,1)~totalPayoff and
										 (0,1)~totalPayoff >= (-1,1)~totalPayoff and
										 (0,1)~totalPayoff >= (-1,0)~totalPayoff and
										 (0,1)~totalPayoff >= (-1,-1)~totalPayoff and
										 (0,1)~totalPayoff >= (0,-1)~totalPayoff and
										 (0,1)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }

rule : { ~stage := 1; ~state := (((-1,1)~cState * 10) + (0,0)~cState); ~cState := (-1,1)~cState; ~totalPayoff := 0; }		
				
							100 {  (-1,1)~totalPayoff >= (0,0)~totalPayoff and 
										 (-1,1)~totalPayoff >= (1,0)~totalPayoff and
										 (-1,1)~totalPayoff >= (1,1)~totalPayoff and
										 (-1,1)~totalPayoff >= (0,1)~totalPayoff and
										 (-1,1)~totalPayoff >= (-1,0)~totalPayoff and
										 (-1,1)~totalPayoff >= (-1,-1)~totalPayoff and
										 (-1,1)~totalPayoff >= (0,-1)~totalPayoff and
										 (-1,1)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }
									 
rule : { ~stage := 1; ~state := (((-1,0)~cState * 10) + (0,0)~cState); ~cState := (-1,0)~cState; ~totalPayoff := 0; }			
				
							100 {  (-1,0)~totalPayoff >= (0,0)~totalPayoff and 
										 (-1,0)~totalPayoff >= (1,0)~totalPayoff and
										 (-1,0)~totalPayoff >= (1,1)~totalPayoff and
										 (-1,0)~totalPayoff >= (0,1)~totalPayoff and
										 (-1,0)~totalPayoff >= (-1,1)~totalPayoff and
										 (-1,0)~totalPayoff >= (-1,-1)~totalPayoff and
										 (-1,0)~totalPayoff >= (0,-1)~totalPayoff and
										 (-1,0)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }
									
rule : { ~stage := 1; ~state := (((-1,-1)~cState * 10) + (0,0)~cState); ~cState := (-1,-1)~cState; ~totalPayoff := 0; }	
				
							100 {  (-1,-1)~totalPayoff >= (0,0)~totalPayoff and 
										 (-1,-1)~totalPayoff >= (1,0)~totalPayoff and
										 (-1,-1)~totalPayoff >= (1,1)~totalPayoff and
										 (-1,-1)~totalPayoff >= (0,1)~totalPayoff and
										 (-1,-1)~totalPayoff >= (-1,1)~totalPayoff and
										 (-1,-1)~totalPayoff >= (-1,0)~totalPayoff and
										 (-1,-1)~totalPayoff >= (0,-1)~totalPayoff and
										 (-1,-1)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																														
									 }									

rule : { ~stage := 1; ~state := (((0,-1)~cState * 10) + (0,0)~cState); ~cState := (0,-1)~cState; ~totalPayoff := 0; }			
				
							100 {  (0,-1)~totalPayoff >= (0,0)~totalPayoff and 
										 (0,-1)~totalPayoff >= (1,0)~totalPayoff and
										 (0,-1)~totalPayoff >= (1,1)~totalPayoff and
										 (0,-1)~totalPayoff >= (0,1)~totalPayoff and
										 (0,-1)~totalPayoff >= (-1,1)~totalPayoff and
										 (0,-1)~totalPayoff >= (-1,0)~totalPayoff and
										 (0,-1)~totalPayoff >= (-1,-1)~totalPayoff and
										 (0,-1)~totalPayoff >= (1,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																															
									 }
									 
rule : { ~stage := 1; ~state := (((1,-1)~cState * 10) + (0,0)~cState); ~cState := (1,-1)~cState; ~totalPayoff := 0; }		
				
							100 {  (1,-1)~totalPayoff >= (0,0)~totalPayoff and 
										 (1,-1)~totalPayoff >= (1,0)~totalPayoff and
										 (1,-1)~totalPayoff >= (1,1)~totalPayoff and
										 (1,-1)~totalPayoff >= (0,1)~totalPayoff and
										 (1,-1)~totalPayoff >= (-1,1)~totalPayoff and
										 (1,-1)~totalPayoff >= (-1,0)~totalPayoff and
										 (1,-1)~totalPayoff >= (-1,-1)~totalPayoff and
										 (1,-1)~totalPayoff >= (0,-1)~totalPayoff and				 		    
				 		    		 (0,0)~stage = 2																															
									 }   																		       																		       																				        																				       											       
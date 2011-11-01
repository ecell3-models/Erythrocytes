# Adenylate Charge

	Process AdenylateCharge_free_FluxProcess( freeCharge )
	{
		Name	Total_calc;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:fATP 0 ] 
[ E1 :/CELL/CYTOPLASM:fADP 0 ] 
[ E2 :/CELL/CYTOPLASM:fAMP 0 ] ;

	}
	Process AdenylateChargeFluxProcess( Charge )
	{
		Name	Total_calc;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:fATP 0 ] 
[ E1 :/CELL/CYTOPLASM:MgATP 0 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHbATP 0 ] 
[ E3 :/CELL/CYTOPLASM:deoxyHbMgATP 0 ] 
[ E4 :/CELL/CYTOPLASM:oxyHbATP 0 ] 
[ E5 :/CELL/CYTOPLASM:oxyHbMgATP 0 ] 
[ E6 :/CELL/CYTOPLASM:fADP 0 ] 
[ E7 :/CELL/CYTOPLASM:MgADP 0 ] 
[ E8 :/CELL/CYTOPLASM:deoxyHbADP 0 ] 
[ E9 :/CELL/CYTOPLASM:oxyHbADP 0 ] 
[ E10 :/CELL/CYTOPLASM:fAMP 0 ] 
[ E11 :/CELL/CYTOPLASM:MgAMP 0 ] 
[ E12 :/CELL/CYTOPLASM:band3deoxyHbMgATP 0 ] 
[ E13 :/CELL/CYTOPLASM:band3deoxyHbATP 0 ] 
[ E14 :/CELL/CYTOPLASM:band3deoxyHbADP 0 ] 
[ E15 :/CELL/CYTOPLASM:band3oxyHbMgATP 0 ] 
[ E16 :/CELL/CYTOPLASM:band3oxyHbATP 0 ] 
[ E17 :/CELL/CYTOPLASM:band3oxyHbADP 0 ]; 

	}

# TotalSumFluxProcess

	Process TotalSumFluxProcess( Pool )
	{
		Name	Total_calc;
		StepperID	DE1;
		VariableReferenceList	
		
		[ E0 :/CELL/CYTOPLASM:fATP 0 ] 
		[ E1 :/CELL/CYTOPLASM:MgATP 0 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHbATP 0 ] 
[ E3 :/CELL/CYTOPLASM:deoxyHbMgATP 0 ] 
[ E4 :/CELL/CYTOPLASM:oxyHbATP 0 ] 
[ E5 :/CELL/CYTOPLASM:oxyHbMgATP 0 ] 
[ E6 :/CELL/CYTOPLASM:fADP 0 ] 
[ E7 :/CELL/CYTOPLASM:MgADP 0 ] 
[ E8 :/CELL/CYTOPLASM:deoxyHbADP 0 ] 
[ E9 :/CELL/CYTOPLASM:oxyHbADP 0 ] 
[ E10 :/CELL/CYTOPLASM:fAMP 0 ] 
[ E11 :/CELL/CYTOPLASM:MgAMP 0 ] 
[ E12 :/CELL/CYTOPLASM:band3deoxyHbMgATP 0 ] 
[ E13 :/CELL/CYTOPLASM:band3deoxyHbATP 0 ] 
[ E14 :/CELL/CYTOPLASM:band3deoxyHbADP 0 ] 
[ E15 :/CELL/CYTOPLASM:band3oxyHbMgATP 0 ] 
[ E16 :/CELL/CYTOPLASM:band3oxyHbATP 0 ] 
[ E17 :/CELL/CYTOPLASM:band3oxyHbADP 0 ]; 
	}

	Process TotalSumFluxProcess( freePool )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:fATP 0 ] 
[ E1 :/CELL/CYTOPLASM:fAMP 0 ] 
[ E2 :/CELL/CYTOPLASM:fADP 0 ]; 
	}

	Process TotalSumFluxProcess( t23DPG )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:f23DPG 0 ] 
[ E1 :/CELL/CYTOPLASM:Mg23DPG 0 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHb23DPG 0 ] 
[ E3 :/CELL/CYTOPLASM:oxyHb23DPG 0 ]
[ E4 :/CELL/CYTOPLASM:band3oxyHb23DPG 0 ]
[ E5 :/CELL/CYTOPLASM:band3deoxyHb23DPG 0 ];
 
	}

	Process TotalSumFluxProcess( toxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	

		[ E0 :/CELL/CYTOPLASM:oxyHb 0 ] 
		[ E1 :/CELL/CYTOPLASM:oxyHbATP 0 ] 
		[ E2 :/CELL/CYTOPLASM:oxyHb23DPG 0 ] 
		[ E3 :/CELL/CYTOPLASM:oxyHb13DPG 0 ]
		[ E4 :/CELL/CYTOPLASM:oxyHbADP 0 ]
		[ E5 :/CELL/CYTOPLASM:oxyHbMgATP 0 ]
		[ E6 :/CELL/CYTOPLASM:band3oxyHb 0 ] 
		[ E7 :/CELL/CYTOPLASM:band3oxyHbATP 0 ] 
		[ E8 :/CELL/CYTOPLASM:band3oxyHb23DPG 0 ] 
		[ E9 :/CELL/CYTOPLASM:band3oxyHb13DPG 0 ]
		[ E10 :/CELL/CYTOPLASM:band3oxyHbADP 0 ]
		[ E11 :/CELL/CYTOPLASM:band3oxyHbMgATP 0 ];

	}

	Process TotalSumFluxProcess( tband3oxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	

	[ E0 :/CELL/CYTOPLASM:band3oxyHb 0 ] 
	[ E1 :/CELL/CYTOPLASM:band3oxyHbATP 0 ] 
	[ E2 :/CELL/CYTOPLASM:band3oxyHb23DPG 0 ] 
	[ E3 :/CELL/CYTOPLASM:band3oxyHb13DPG 0 ]
	[ E4 :/CELL/CYTOPLASM:band3oxyHbADP 0 ]
	[ E5 :/CELL/CYTOPLASM:band3oxyHbMgATP 0 ];
	}

	Process TotalSumFluxProcess( tdeoxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	

		[ E0 :/CELL/CYTOPLASM:deoxyHb 0 ] 
		[ E1 :/CELL/CYTOPLASM:deoxyHbATP 0 ] 
		[ E2 :/CELL/CYTOPLASM:deoxyHb23DPG 0 ] 
		[ E3 :/CELL/CYTOPLASM:deoxyHb13DPG 0 ]
		[ E4 :/CELL/CYTOPLASM:deoxyHbADP 0 ]
		[ E5 :/CELL/CYTOPLASM:deoxyHbMgATP 0 ]
		[ E6 :/CELL/CYTOPLASM:band3deoxyHb 0 ] 
		[ E7 :/CELL/CYTOPLASM:band3deoxyHbATP 0 ] 
		[ E8 :/CELL/CYTOPLASM:band3deoxyHb23DPG 0 ] 
		[ E9 :/CELL/CYTOPLASM:band3deoxyHb13DPG 0 ]
		[ E10 :/CELL/CYTOPLASM:band3deoxyHbADP 0 ]
		[ E11 :/CELL/CYTOPLASM:band3deoxyHbMgATP 0 ]
		[ E12 :/CELL/CYTOPLASM:deoxyHbFDP 0 ]
		[ E13 :/CELL/CYTOPLASM:deoxyHbGDP 0 ]
		[ E14 :/CELL/CYTOPLASM:band3deoxyHbFDP 0 ] 
		[ E15 :/CELL/CYTOPLASM:band3deoxyHbGDP 0 ];
	}

	Process TotalSumFluxProcess( tband3deoxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	

		[ E0 :/CELL/CYTOPLASM:band3deoxyHb 0 ] 
		[ E1 :/CELL/CYTOPLASM:band3deoxyHbATP 0 ] 
		[ E2 :/CELL/CYTOPLASM:band3deoxyHb23DPG 0 ] 
		[ E3 :/CELL/CYTOPLASM:band3deoxyHb13DPG 0 ]
		[ E4 :/CELL/CYTOPLASM:band3deoxyHbADP 0 ]
		[ E5 :/CELL/CYTOPLASM:band3deoxyHbMgATP 0 ]
		[ E6 :/CELL/CYTOPLASM:band3deoxyHbFDP 0 ] 
		[ E7 :/CELL/CYTOPLASM:band3deoxyHbGDP 0 ];
	}
	
	Process TotalSumFluxProcess( tGDP )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:GDP 0 ] 
[ E1 :/CELL/CYTOPLASM:MgGDP 0 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHbGDP 0 ] 
[ E3 :/CELL/CYTOPLASM:band3deoxyHbGDP 0 ];
} 


	Process TotalSumFluxProcess( tBPG )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:BPGSP 0 ] 
[ E1 :/CELL/CYTOPLASM:BPGSPP 0 ] 
[ E2 :/CELL/CYTOPLASM:BPGSPP_P2GA 0 ] 
[ E3 :/CELL/CYTOPLASM:BPGSPP_P3GA 0 ] 
[ E4 :/CELL/CYTOPLASM:BPGSPP_Phos 0 ] 
[ E5 :/CELL/CYTOPLASM:BPGSP_B13PG 0 ] 
[ E6 :/CELL/CYTOPLASM:BPGSP_B23PG 0 ]; 
}



	Process TotalSumFluxProcess( tPFK )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:E_PFK 0 ] 
[ E1 :/CELL/CYTOPLASM:band3PFK 0 ];
} 

	Process TotalSumFluxProcess( tATP )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ E0 :/CELL/CYTOPLASM:fATP 0 ] 
[ E1 :/CELL/CYTOPLASM:MgATP 0 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHbATP 0 ] 
[ E3 :/CELL/CYTOPLASM:oxyHbATP 0 ] 
[ E4 :/CELL/CYTOPLASM:deoxyHbMgATP 0 ] 
[ E5 :/CELL/CYTOPLASM:oxyHbMgATP 0 ]
[ E6 :/CELL/CYTOPLASM:band3oxyHbMgATP 0 ]
[ E7 :/CELL/CYTOPLASM:band3oxyHbATP 0 ]
[ E8 :/CELL/CYTOPLASM:band3deoxyHbMgATP 0 ]
[ E9 :/CELL/CYTOPLASM:band3deoxyHbATP 0 ];
 
	}	



	Process TotalSumProcess( TotalCalc_23DPG )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	
[ P0 :/CELL/CYTOPLASM:t23DPG ] 
[ E0 :/CELL/CYTOPLASM:f23DPG 1 ] 
[ E1 :/CELL/CYTOPLASM:Mg23DPG 1 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHb23DPG 1 ] 
[ E3 :/CELL/CYTOPLASM:oxyHb23DPG 1 ] 
[ E4 :/CELL/CYTOPLASM:band3deoxyHb23DPG 1 ] 
[ E5 :/CELL/CYTOPLASM:band3oxyHb23DPG 1 ];
	}
	
	Process TotalSumProcess( TotalCalc_ATP )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	[ P0 :/CELL/CYTOPLASM:tATP ] 
[ E0 :/CELL/CYTOPLASM:fATP 1 ] 
[ E1 :/CELL/CYTOPLASM:MgATP 1 ] 
[ E2 :/CELL/CYTOPLASM:deoxyHbATP 1 ] 
[ E3 :/CELL/CYTOPLASM:oxyHbATP 1 ] 
[ E4 :/CELL/CYTOPLASM:band3deoxyHbATP 1 ] 
[ E5 :/CELL/CYTOPLASM:band3oxyHbATP 1 ] 
[ E6 :/CELL/CYTOPLASM:deoxyHbMgATP 1 ] 
[ E7 :/CELL/CYTOPLASM:oxyHbMgATP 1 ] 
[ E8 :/CELL/CYTOPLASM:band3deoxyHbMgATP 1 ] 
[ E9 :/CELL/CYTOPLASM:band3oxyHbMgATP 1 ];


	}
	
	Process TotalSumProcess( TotalCalc_deoxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	[ P0 :/CELL/CYTOPLASM:tdeoxyHb ] [ E0 :/CELL/CYTOPLASM:deoxyHb 1 ] [ E1 :/CELL/CYTOPLASM:deoxyHbMgATP 1 ] [ E10 :/CELL/CYTOPLASM:band3deoxyHbADP 1 ] [ E11 :/CELL/CYTOPLASM:band3deoxyHb23DPG 1 ] [ E12 :/CELL/CYTOPLASM:band3deoxyHb13DPG 1 ] [ E13 :/CELL/CYTOPLASM:band3deoxyHbFDP 1 ] [ E14 :/CELL/CYTOPLASM:band3deoxyHbGDP 1 ] [ E2 :/CELL/CYTOPLASM:deoxyHbATP 1 ] [ E3 :/CELL/CYTOPLASM:deoxyHbADP 1 ] [ E4 :/CELL/CYTOPLASM:deoxyHb23DPG 1 ] [ E5 :/CELL/CYTOPLASM:deoxyHb13DPG 1 ] [ E6 :/CELL/CYTOPLASM:deoxyHbFDP 1 ] [ E7 :/CELL/CYTOPLASM:deoxyHbGDP 1 ] [ E8 :/CELL/CYTOPLASM:band3deoxyHbMgATP 1 ] [ E9 :/CELL/CYTOPLASM:band3deoxyHbATP 1 ];
	}
	
	Process TotalSumProcess( TotalCalc_oxyHb )
	{
		Name	Total_calc;
		Priority	-8;
		StepperID	DE1;
		VariableReferenceList	[ P0 :/CELL/CYTOPLASM:toxyHb ] 
[ E0 :/CELL/CYTOPLASM:oxyHb 1 ] 
[ E1 :/CELL/CYTOPLASM:oxyHbMgATP 1 ] 
[ E10 :/CELL/CYTOPLASM:band3oxyHbADP 1 ] 
[ E11 :/CELL/CYTOPLASM:band3oxyHb23DPG 1 ] 
[ E12 :/CELL/CYTOPLASM:band3oxyHb13DPG 1 ] 
[ E2 :/CELL/CYTOPLASM:oxyHbATP 1 ] 
[ E3 :/CELL/CYTOPLASM:oxyHbADP 1 ] 
[ E4 :/CELL/CYTOPLASM:oxyHb23DPG 1 ] 
[ E5 :/CELL/CYTOPLASM:oxyHb13DPG 1 ] 
[ E8 :/CELL/CYTOPLASM:band3oxyHbMgATP 1 ] 
[ E9 :/CELL/CYTOPLASM:band3oxyHbATP 1 ];
	}

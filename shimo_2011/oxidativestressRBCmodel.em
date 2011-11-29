#
# Erythrocyte Model With Oxidative Stress
#

# created by eml2em program
# from file: 0701-band3.eml, date: Sun Jul  2 08:23:17 2006
#



@{
N_A  = 6.02214 * 1.0e+23
Voli = 1.0e-13 
Vole = 1.0e-13
}


Stepper ODEStepper( DE1 )
{

	MaxStepInterval	100.0;
	MinStepInterval	1e-100;
}

# Stepper PassiveStepper( Passive )
# {
# 	MaxStepInterval	1.79769313486e+308;
# 	MinStepInterval	2.22507385851e-308;
#	Priority	0;
#	StepInterval	inf;
#}

System System( / )
{
	Name	The;
	StepperID	DE1;

	Variable Variable( SIZE )
	{
		Fixed	0;
		Value	1.0;
	}
	
	
}

System System( /CELL )
{
	Name	The;
	StepperID	DE1;
}

System System( /CELL/CYTOPLASM )
{
	Name	The;
	StepperID	DE1;

	Variable Variable( AC_6PGLase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_6PGLase;
		Value	1000.0;
	}
	
	Variable Variable( AC_6PGODH )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_6PGODH;
		Value	1000.0;
	}
	
	Variable Variable( AC_ADA )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ADA;
		Value	1000.0;
	}
	
	Variable Variable( AC_ADPRT )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ADPRT;
		Value	1000.0;
	}
	
	Variable Variable( AC_AK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_AK;
		Value	1000.0;
	}
	
	Variable Variable( AC_ALD )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ALD;
		Value	1000.0;
	}
	
	Variable Variable( AC_AMPDA )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_AMPDA;
		Value	1000.0;
	}
	
	Variable Variable( AC_AMPase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_AMPase;
		Value	1000.0;
	}
	
	Variable Variable( AC_APK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_APK;
		Value	1000.0;
	}

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


### SOD Enzyme Reaction ###

    Process ExpressionFluxProcess( SOD )
    {
		Name	"Superoxide Dismutase";

		Expression "(2.37e+9* S0.MolarConc * E1.MolarConc)* E0.Value * 6.02214 * 1.0e+23";

		VariableReferenceList

			 [ S0 :.:O2minus -2]
			 [ P0 :.:Internal_H2O2 1] 
			 [ E0 :.:SIZE 0]
			 [ E1 :.:SOD 0];
	}




### CAT Enzyme Reaction ###


    Process ExpressionFluxProcess( CAT )
    {
		Name	"Catalase";

		Expression "(3.4e+7* S0.MolarConc * E1.MolarConc)* E0.Value * 6.02214 * 1.0e+23";

		VariableReferenceList

			 [ S0 :.:Internal_H2O2 -2] 
			 [ E0 :.:SIZE 0]
			 [ E1 :.:CAT 0];
	}




###  GSHpx Reaction ###

    Process ExpressionFluxProcess( GSHpx )
    {
		Name	"Gulutathione peroxidase";

		Expression "((0.17e-6)/(1+(3.1e-3/S0.MolarConc)+(27.0e-6/S1.MolarConc)+(3.1e-3*27.0e-6/(S0.MolarConc*S1.MolarConc))))* E0.Value * 6.02214 * 1.0e+23";

		VariableReferenceList

			 [ S0 :.:GSH -2]
			 [ S1 :.:Internal_H2O2 -1]
			 [ P1 :.:GSSG 1] 
			 [ E0 :.:SIZE 0] 
			 [ E1 :.:GSHpx 0];
	}




### Making of Superoxide ###

    Process ExpressionFluxProcess ( Superoxide )
    {
		Name	"Superoxide";

		Expression "(2.3e-8*S1.Value)/(74.8+S1.Value) * E0.Value * 6.02214 * 1.0e+23 ";
	
		VariableReferenceList

#			[ S0 :.:External_H2O2 -1]
			[ S1 :.:PO2 0]
			[ P0 :.:O2minus 1]
			[ E0 :.:SIZE 0];


	}


	Variable Variable( AC_ATPase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ATPase;
		Value	2000.0;
	}
	
	Variable Variable( AC_BPGSP1 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP1;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP2 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP2;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP3 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP3;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP4 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP4;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP5 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP5;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP6 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP6;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP7 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP7;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP8 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP8;
		Value	1000.0;
	}
	
	Variable Variable( AC_BPGSP9 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_BPGSP9;
		Value	1000.0;
	}
	
	Variable Variable( AC_DPGM )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_DPGM;
		Value	1000.0;
	}
	
	Variable Variable( AC_DPGase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_DPGase;
		Value	1000.0;
	}
	
	Variable Variable( AC_EN )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_EN;
		Value	1000.0;
	}
	
	Variable Variable( AC_G6PDH )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_G6PDH;
		Value	1000.0;
	}
	
	Variable Variable( AC_GAPDH )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_GAPDH;
		Value	1000.0;
	}
	
	Variable Variable( AC_GSH_S )
	{
		Fixed	0;
		Name	Activity_GSH_S;
		Value	1000.0;
	}
	
	Variable Variable( AC_GSSGR )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_GSSGR;
		Value	1000.0;
	}
	
	Variable Variable( AC_GSSG_transport )
	{
		Fixed	0;
		Name	Activity_GSSG_transport;
		Value	1000.0;
	}
	
	Variable Variable( AC_HGPRT )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_HGPRT;
		Value	1000.0;
	}
	
	Variable Variable( AC_HK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_HK;
		Value	1000.0;
	}
	
	Variable Variable( AC_IMPase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_IMPase;
		Value	1000.0;
	}
	
	Variable Variable( AC_LDH )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_LDH;
		Value	1000.0;
	}
	
	Variable Variable( AC_LDH2 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_LDH2;
		Value	1000.0;
	}
	
	Variable Variable( AC_L_GCS )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_L_GCS;
		Value	1000.0;
	}
	
	Variable Variable( AC_NADPHbound )
	{
		Fixed	0;
		Name	Activity_coefficient_of_NADPHbound;
		Value	1000.0;
	}
	
	Variable Variable( AC_NADPbound )
	{
		Fixed	0;
		Name	Activity_coefficient_of_NADPbound;
		Value	1000.0;
	}
	
	Variable Variable( AC_PFK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PFK;
		Value	1000.0;
	}
	
	Variable Variable( AC_PGI )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PGI;
		Value	1000.0;
	}
	
	Variable Variable( AC_PGK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PGK;
		Value	1000.0;
	}
	
	Variable Variable( AC_PGM )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PGM;
		Value	1000.0;
	}
	
	Variable Variable( AC_PK )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PK;
		Value	1000.0;
	}
	
	Variable Variable( AC_PNPase )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PNPase;
		Value	1000.0;
	}
	
	Variable Variable( AC_PRM )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PRM;
		Value	1000.0;
	}
	
	Variable Variable( AC_PRPPsyn )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PRPPsyn;
		Value	1000.0;
	}
	
	Variable Variable( AC_R5PI )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_R5PI;
		Value	1000.0;
	}
	
	Variable Variable( AC_TA )
	{
		Fixed	0;
		Name	Activity_coefficient_of_TA;
		Value	1000.0;
	}
	
	Variable Variable( AC_TK1 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_TK1;
		Value	1000.0;
	}
	
	Variable Variable( AC_TK2 )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_TK2;
		Value	1000.0;
	}
	
	Variable Variable( AC_TPI )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_TPI;
		Value	1000.0;
	}
	
	Variable Variable( AC_X5PI )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_X5PI;
		Value	1000.0;
	}
	
	Variable Variable( ADE )
	{
		Fixed	0;
		Name	Adenine;
		Value	894971.391725;
	}
	
	Variable Variable( ADO )
	{
		Fixed	0;
		Name	Adenosine;
		Value	2695.3994417;
	}
	
	Variable Variable( BPGSP )
	{
		Fixed	0;
		Value	13177.8507416;
	}
	
	Variable Variable( BPGSPP )
	{
		Fixed	0;
		Value	27700.3325174;
	}
	
	Variable Variable( BPGSPP_P2GA )
	{
		Fixed	0;
		Value	0.343196003477;
	}
	
	Variable Variable( BPGSPP_P3GA )
	{
		Fixed	0;
		Value	2.95674213921;
	}
	
	Variable Variable( BPGSPP_Phos )
	{
		Fixed	0;
		Value	46159.7130225;
	}
	
	Variable Variable( BPGSP_B13PG )
	{
		Fixed	0;
		Value	885.893482251;
	}
	
	Variable Variable( BPGSP_B23PG )
	{
		Fixed	0;
		Value	54011.7969339;
	}
	
	Variable Variable( CO2 )
	{
		Fixed	0;
		Name	CO2;
		Value	72265640.4;
	}
	
	Variable Variable( DHAP )
	{
		Fixed	0;
		Name	Dihydroxyacetone_phosphate;
		Value	1218337.23723;
	}
	
	Variable Variable( E4P )
	{
		Fixed	0;
		Name	Erythrose_4_phosphate;
		Value	33162.3714976;
	}
	
	Variable Variable( E_6PGLase )
	{
		Fixed	0;
		Name	6;
		Value	1.0;
	}
	
	Variable Variable( E_6PGODH )
	{
		Fixed	0;
		Name	6;
		Value	126465.0;
	}
	
	Variable Variable( E_ADA )
	{
		Fixed	0;
		Name	Adenosine_deaminase;
		Value	1.0;
	}
	
	Variable Variable( E_ADPRT )
	{
		Fixed	0;
		Name	Adenine_phosphoribosyl_transferase;
		Value	1.0;
	}
	
	Variable Variable( E_AK )
	{
		Fixed	0;
		Name	Adenosine_kinase;
		Value	1.0;
	}
	
	Variable Variable( E_ALD )
	{
		Fixed	0;
		Name	Aldorase;
		Value	10629.7625104;
	}
	
	Variable Variable( E_AMPDA )
	{
		Fixed	0;
		Name	AMP_deaminase;
		Value	1.0;
	}
	
	Variable Variable( E_AMPase )
	{
		Fixed	0;
		Name	AMP_phosphohydrolase;
		Value	1.0;
	}
	
	Variable Variable( E_APK )
	{
		Fixed	0;
		Name	Adenylate_kinase;
		Value	58394.0;
	}
	
	Variable Variable( E_ATPase )
	{
		Fixed	0;
		Name	ATP_phosphohydrolase;
		Value	1.0;
	}
	
	Variable Variable( E_EN )
	{
		Fixed	0;
		Name	Enolase;
		Value	13244.0;
	}
	
	Variable Variable( E_G6PDH )
	{
		Fixed	0;
		Name	Glucose_6_phosphate_dehydrogenase;
		Value	1.0;
	}
	
	Variable Variable( E_GAPDH )
	{
		Fixed	0;
		Name	Glyceraldehyde_phosphate_dehydrogenase;
		Value	144440.810299;
	}
	
	Variable Variable( E_GSH_S )
	{
		Fixed	0;
		Name	glutathione_synthetase;
		Value	1.0;
	}
	
	Variable Variable( E_GSSGR )
	{
		Fixed	0;
		Name	Glutathione_reductase;
		Value	7528.0;
	}
	
	Variable Variable( E_GSSG_transport )
	{
		Fixed	0;
		Name	GSSG_transport;
		Value	1.0;
	}
	
	Variable Variable( E_HGPRT )
	{
		Fixed	0;
		Name	Hypoxanthine_guanine_phosphoryl_transferase;
		Value	1.0;
	}
	
	Variable Variable( E_HK )
	{
		Fixed	0;
		Name	Hexokinase;
		Value	1444.8;
	}
	
	Variable Variable( E_IMPase )
	{
		Fixed	0;
		Name	Inosine_monophosphatase;
		Value	1.0;
	}
	
	Variable Variable( E_LDH )
	{
		Fixed	0;
		Name	Lactate_dehydrogenase;
		Value	206679.731536;
	}
	
	Variable Variable( E_L_GCS )
	{
		Fixed	0;
		Name	L_Glutamyl_cysteine_synthetase;
		Value	1.0;
	}
	
	Variable Variable( E_PFK )
	{
		Fixed	0;
		Name	Phosphofructokinase;
		Value	1022.06626748;
	}
	
	Variable Variable( E_PGI )
	{
		Fixed	0;
		Name	Phosphoglucoisomerase;
		Value	13123.6;
	}
	
	Variable Variable( E_PGK )
	{
		Fixed	0;
		Name	Phosphoglycerate_kinase;
		Value	164948.0;
	}
	
	Variable Variable( E_PGM )
	{
		Fixed	0;
		Name	Phosphoglyceromutase;
		Value	24682.0;
	}
	
	Variable Variable( E_PK )
	{
		Fixed	0;
		Name	Pyruvate_kinase;
		Value	5237.4;
	}
	
	Variable Variable( E_PNPase )
	{
		Fixed	0;
		Name	Purine_nucleoside_phosphorylase;
		Value	896378.0;
	}
	
	Variable Variable( E_PRM )
	{
		Fixed	0;
		Name	Phosphoribomutase;
		Value	1.0;
	}
	
	Variable Variable( E_PRPPsyn )
	{
		Fixed	0;
		Name	Phosphoribosyl_pyrophosphate_synthetase;
		Value	1.0;
	}
	
	Variable Variable( E_R5PI )
	{
		Fixed	0;
		Name	Ribose_5_phosphate_isomerase;
		Value	854840.0;
	}
	
	Variable Variable( E_TA )
	{
		Fixed	0;
		Name	Transaldolase;
		Value	41553.0;
	}
	
	Variable Variable( E_TK1 )
	{
		Fixed	0;
		Name	Transketolase_I;
		Value	19873.0;
	}
	
	Variable Variable( E_TK2 )
	{
		Fixed	0;
		Name	Transketolase_II;
		Value	19873.0;
	}
	
	Variable Variable( E_TPI )
	{
		Fixed	0;
		Name	Triose_Phosphate_Isomerase;
		Value	68628.0;
	}
	
	Variable Variable( E_X5PI )
	{
		Fixed	0;
		Name	Xylulose_5_phosphate_isomerase;
		Value	254044.0;
	}
	
	Variable Variable( F6P )
	{
		Fixed	0;
		Name	Fructose_6_phosphate;
		Value	1189322.88976;
	}
	
	Variable Variable( FDP )
	{
		Fixed	0;
		Name	free_FDP;
		Value	360351.331018;
	}
	
	Variable Variable( G6P )
	{
		Fixed	0;
		Name	Glucose_6_phosphate;
		Value	3646419.11708;
	}
	
	Variable Variable( GA3P )
	{
		Fixed	0;
		Name	Glyceraldehyde_3_phosphate;
		Value	293549.547134;
	}
	
	Variable Variable( GDP )
	{
		Fixed	0;
		Name	free_GDP;
		Value	5774287.25996;
	}
	
	Variable Variable( GL6P )
	{
		Fixed	0;
		Name	Gluconolactone_6_phosphate;
		Value	315.897268678;
	}
	
	Variable Variable( GLC )
	{
		Fixed	0;
		Name	Glucose;
		Value	301106835.0;
	}
	
	Variable Variable( GO6P )
	{
		Fixed	0;
		Name	Gluconate_6_phosphate;
		Value	2678006.43366;
	}
	
	Variable Variable( GSH )
	{
		Fixed	0;
		Name	ReducedGlutathione;
		Value	195606915.85;
	}
	
#		Variable Variable ( SIZE )
#	{
#		Value   @(  Voli );
#	}

	Variable Variable ( SOD )
	{
		Value	@( 2.0e-6 * Voli * N_A );
	}

	Variable Variable ( CAT )
	{
		Value	@( 1.0e-9 * Voli * N_A );
	}
	
	Variable Variable ( GSHpx )
	{
		Value	@( 8.17e-6 * Voli * N_A );
	}

	Variable Variable ( Internal_H2O2 )
	{
		Value	@( 1.0e-7 * Voli * N_A );
	}

	Variable Variable ( O2minus )
	{
		Value	@( 2.0e-13 * Voli * N_A );
	}

#	Variable Variable ( GSH )
#		Value	@( 3.2e-3 * Voli * N_A );
#	}
#	Variable Variable ( GSSG )
#	{
#		Value	@( 4.2e-6 * Voli * N_A );
#	}
#	Variable Variable ( PO2 )
#	{
#		Value	30;
#	}

	Variable Variable( GSSG )
	{
		Fixed	0;
		Name	oxidized_glutathione;
		Value	278134.054355;
	}
	
	Variable Variable( H )
	{
		Fixed	0;
		Name	Proton;
		Value	3798.363214;
	}
	
	Variable Variable( HXi )
	{
		Fixed	0;
		Name	Hypoxanthine_in;
		Value	97464.6949093;
	}
	
	Variable Variable( IMP )
	{
		Fixed	0;
		Name	Inosine_monophosphate;
		Value	494909.138032;
	}
	
	Variable Variable( INO )
	{
		Fixed	0;
		Name	Inosine;
		Value	8780.67666635;
	}
	
	Variable Variable( Ki )
	{
		Fixed	0;
		Name	Ki;
		Value	8304686885.21;
	}
	
	Variable Variable( LACi )
	{
		Fixed	0;
		Name	Lactate_in;
		Value	80301652.0716;
	}
	
	Variable Variable( L_GC )
	{
		Fixed	0;
		Name	L_Glutamyl_cysteine;
		Value	24040.7114698;
	}
	
	Variable Variable( Mg )
	{
		Fixed	0;
		Name	Mg;
		Value	26234067.2587;
	}
	
	Variable Variable( Mg13DPG )
	{
		Fixed	0;
		Name	Mg13DPG;
		Value	1817.22498782;
	}
	
	Variable Variable( Mg23DPG )
	{
		Fixed	0;
		Name	Mg23DPG;
		Value	42362012.5938;
	}
	
	Variable Variable( MgADP )
	{
		Fixed	0;
		Name	MgADP;
		Value	6900782.22224;
	}
	
	Variable Variable( MgAMP )
	{
		Fixed	0;
		Name	MgAMP;
		Value	39963.1155779;
	}
	
	Variable Variable( MgATP )
	{
		Fixed	0;
		Name	MgATP;
		Value	91472806.4996;
	}
	
	Variable Variable( MgFDP )
	{
		Fixed	0;
		Name	MgFDP;
		Value	65965.4279636;
	}
	
	Variable Variable( MgGDP )
	{
		Fixed	0;
		Name	MgGDP;
		Value	1057033.22702;
	}
	
	Variable Variable( MgPi )
	{
		Fixed	0;
		Name	MgPi;
		Value	925245.597526;
	}
	
	Variable Variable( NAD )
	{
		Fixed	0;
		Name	NAD;
		Value	3915811.35499;
	}
	
	Variable Variable( NADH )
	{
		Fixed	0;
		Name	NADH;
		Value	16643.8710818;
	}
	
	Variable Variable( NADP )
	{
		Fixed	0;
		Name	NADP;
		Value	3902.83468684;
	}
	
	Variable Variable( NADPH )
	{
		Fixed	0;
		Name	NADPH;
		Value	3931348.80531;
	}
	
#	Variable Variable( NADPHbound )
#	{
#		Fixed	0;
#		Name	NADPH_bound;
#		Value	5.9478389214e-317;
#	}
	
#	Variable Variable( NADPbound )
#	{
#		Fixed	0;
#		Name	NADP_bound;
#		Value	6.0190634249e-317;
#	}
	
	Variable Variable( Nai )
	{
		Fixed	0;
		Name	Nai;
		Value	1938176767.04;
	}
	
	Variable Variable( PCO2 )
	{
		Fixed	0;
		Name	PO2;
		Value	40.0;
	}
	
	Variable Variable( PEP )
	{
		Fixed	0;
		Name	Phosphoenolpyrvate;
		Value	582645.555217;
	}
	
	Variable Variable( PO2 )
	{
		Fixed	0;
		Name	PO2;
		Value	100.0;
	}
	
	Variable Variable( PRPP )
	{
		Fixed	0;
		Name	5;
		Value	88715.2120946;
	}
	
	Variable Variable( PYRi )
	{
		Fixed	0;
		Name	Pyrvate_in;
		Value	3110331.4457;
	}
	
	Variable Variable( Pi )
	{
		Fixed	0;
		Name	free_Pi;
		Value	61215118.9307;
	}
	
	Variable Variable( R1P )
	{
		Fixed	0;
		Name	Ribose_1_phosphate;
		Value	5061867.67158;
	}
	
	Variable Variable( R5P )
	{
		Fixed	0;
		Name	Ribose_5_phosphate;
		Value	366984.590102;
	}
	
	Variable Variable( RU5P )
	{
		Fixed	0;
		Name	Ribulose_5_phosphate;
		Value	308466.707644;
	}
	
	Variable Variable( S7P )
	{
		Fixed	0;
		Name	Sedoheptulose_7_phosphate;
		Value	1051428.40756;
	}
	
	Variable Variable( SIZE )
	{
		Fixed	0;
		Name	Volume;
		Value	1e-13;
	}
	
	Variable Variable( T )
	{
		Fixed	0;
		Name	temperature;
		Value	37.0;
	}
	
	Variable Variable( X5P )
	{
		Fixed	0;
		Name	Xylulose_5_phosphate;
		Value	563204.916455;
	}
	
	Variable Variable( _13DPG )
	{
		Fixed	0;
		Name	free_13DPG;
		Value	20743.1860754;
	}
	
	Variable Variable( _2PG )
	{
		Fixed	0;
		Name	2;
		Value	1048454.2949;
	}
	
	Variable Variable( _3PG )
	{
		Fixed	0;
		Name	3;
		Value	3474618.64191;
	}
	
	Variable Variable( band3 )
	{
		Fixed	0;
		Name	band3;
		Value	66018.6560696;
	}
	
	Variable Variable( band3ALD )
	{
		Fixed	0;
		Value	11653.0505738;
	}
	
	Variable Variable( band3GAPDH )
	{
		Fixed	0;
		Value	316691.189607;
	}
	
	Variable Variable( band3PFK )
	{
		Fixed	0;
		Value	5602.28410233;
	}
	
	Variable Variable( band3_ka )
	{
		Fixed	0;
		Value	1.0;
	}
	
	Variable Variable( band3_kd )
	{
		Fixed	0;
		Value	1.0;
	}
	
	Variable Variable( band3deoxyHb )
	{
		Fixed	0;
		Value	57742.7401447;
	}
	
	Variable Variable( band3deoxyHb13DPG )
	{
		Fixed	0;
		Value	30.8286098048;
	}
	
	Variable Variable( band3deoxyHb23DPG )
	{
		Fixed	0;
		Value	657413.972772;
	}
	
	Variable Variable( band3deoxyHbADP )
	{
		Fixed	0;
		Value	7699.64809685;
	}
	
	Variable Variable( band3deoxyHbATP )
	{
		Fixed	0;
		Value	19244.569881;
	}
	
	Variable Variable( band3deoxyHbFDP )
	{
		Fixed	0;
		Value	348.974974289;
	}
	
	Variable Variable( band3deoxyHbGDP )
	{
		Fixed	0;
		Value	5591.99196625;
	}
	
	Variable Variable( band3deoxyHbMgATP )
	{
		Fixed	0;
		Value	12279.1080023;
	}
	
	Variable Variable( band3oxyHb )
	{
		Fixed	0;
		Value	23308.1674044;
	}
	
	Variable Variable( band3oxyHb13DPG )
	{
		Fixed	0;
		Value	2.54234996508;
	}
	
	Variable Variable( band3oxyHb23DPG )
	{
		Fixed	0;
		Value	13268.4341728;
	}
	
	Variable Variable( band3oxyHbADP )
	{
		Fixed	0;
		Value	647.500903527;
	}
	
	Variable Variable( band3oxyHbATP )
	{
		Fixed	0;
		Value	1075.59333202;
	}
	
	Variable Variable( band3oxyHbFDP )
	{
		Fixed	0;
		Value	0.0;
	}
	
	Variable Variable( band3oxyHbGDP )
	{
		Fixed	0;
		Value	0.0;
	}
	
	Variable Variable( band3oxyHbMgATP )
	{
		Fixed	0;
		Value	1380.74706917;
	}
	
	Variable Variable( cysteine )
	{
		Fixed	0;
		Name	cysteine;
		Value	12044.2734;
	}
	
	Variable Variable( deoxyHb )
	{
		Fixed	0;
		Name	deoxyHb;
		Value	5267218.31807;
	}
	
	Variable Variable( deoxyHb13DPG )
	{
		Fixed	0;
		Name	deoxyHb13DPG;
		Value	2812.14604429;
	}
	
	Variable Variable( deoxyHb23DPG )
	{
		Fixed	0;
		Name	deoxyHb23DPG;
		Value	59968455.1038;
	}
	
	Variable Variable( deoxyHbADP )
	{
		Fixed	0;
		Name	deoxyHbADP;
		Value	702351.973543;
	}
	
	Variable Variable( deoxyHbATP )
	{
		Fixed	0;
		Name	deoxyHbATP;
		Value	1755464.85578;
	}
	
	Variable Variable( deoxyHbFDP )
	{
		Fixed	0;
		Name	deoxyHbFDP;
		Value	31833.0472803;
	}
	
	Variable Variable( deoxyHbGDP )
	{
		Fixed	0;
		Name	deoxyHbGDP;
		Value	510094.298354;
	}
	
	Variable Variable( deoxyHbMgATP )
	{
		Fixed	0;
		Name	deoxyHbMgATP;
		Value	1120084.4026;
	}
	
	Variable Variable( f23DPG )
	{
		Fixed	0;
		Name	f23DPG;
		Value	137126738.447;
	}
	
	Variable Variable( fADP )
	{
		Fixed	0;
		Name	free_ADP;
		Value	6691798.43574;
	}
	
	Variable Variable( fAMP )
	{
		Fixed	0;
		Name	free_AMP;
		Value	2036562.43934;
	}
	
	Variable Variable( fATP )
	{
		Fixed	0;
		Name	free_ATP;
		Value	7719480.62318;
	}
	
	Variable Variable( glutamate )
	{
		Fixed	0;
		Name	glutamate;
		Value	12044273.4;
	}
	
	Variable Variable( glycine )
	{
		Fixed	0;
		Name	glycine;
		Value	10839846.06;
	}
	
	Variable Variable( oxyHb )
	{
		Fixed	0;
		Name	oxyHb;
		Value	212614098.336;
	}
	
	Variable Variable( oxyHb13DPG )
	{
		Fixed	0;
		Name	oxyHb13DPG;
		Value	23190.9886393;
	}
	
	Variable Variable( oxyHb23DPG )
	{
		Fixed	0;
		Name	oxyHb23DPG;
		Value	121032946.05;
	}
	
	Variable Variable( oxyHbADP )
	{
		Fixed	0;
		Name	oxyHbADP;
		Value	5906419.77065;
	}
	
	Variable Variable( oxyHbATP )
	{
		Fixed	0;
		Name	oxyHbATP;
		Value	9811423.71667;
	}
	
	Variable Variable( oxyHbMgATP )
	{
		Fixed	0;
		Name	oxyHbMgATP;
		Value	12594996.7687;
	}
	
	Variable Variable( pHi )
	{
		Fixed	0;
		Name	pHi;
		Value	7.2;
	}
	
	Variable Variable( t23DPG )
	{
		Fixed	0;
		Name	t23DPG;
		Value	361160834.601;
	}
	
	Variable Variable( tATP )
	{
		Fixed	0;
		Name	tATP;
		Value	138223318.056;
	}
	
	Variable Variable( tdeoxyHb )
	{
		Fixed	0;
		Name	tdeoxyHb;
		Value	70060923.2398;
	}
	
	Variable Variable( toxyHb )
	{
		Fixed	0;
		Name	toxyHb;
		Value	361999450.448;
	}

	
	Process RBC_BiUniBPGSP1FluxProcess( BPGSP1 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:_13DPG -1 ] [ S1 :/CELL/CYTOPLASM:BPGSP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:AC_BPGSP1 ] [ P0 :/CELL/CYTOPLASM:BPGSP_B13PG 1 ];
		k1	80000000.0;
		k2	400.0;
	}
	
	Process UniBiBPGSP2FluxProcess( BPGSP2 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSP_B13PG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:AC_BPGSP2 ] [ P0 :/CELL/CYTOPLASM:BPGSPP 1 ] [ P1 :/CELL/CYTOPLASM:_3PG 1 ];
		k3	9.9;
	}
	
	Process BiUniBPGSP3FluxProcess( BPGSP3 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP -1 ] [ S1 :/CELL/CYTOPLASM:_3PG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:AC_BPGSP3 ] [ P0 :/CELL/CYTOPLASM:BPGSPP_P3GA 1 ];
		k4	185000000.0;
		k5	100000000.0;
	}
	
	Process BiUniBPGSP4FluxProcess( BPGSP4 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP -1 ] [ S1 :/CELL/CYTOPLASM:_2PG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:AC_BPGSP4 ] [ P0 :/CELL/CYTOPLASM:BPGSPP_P2GA 1 ];
		k6	1000.0;
		k7	1000.0;
	}
	
	Process UniUniBPGSP5FluxProcess( BPGSP5 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP_P3GA -1 ] [ E0 :/CELL/CYTOPLASM:AC_BPGSP5 ] [ P0 :/CELL/CYTOPLASM:BPGSP_B23PG 1 ];
		k8	10000.0;
		k9	0.55;
	}
	
	Process UniUniBPGSP6FluxProcess( BPGSP6 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP_P2GA -1 ] [ E0 :/CELL/CYTOPLASM:AC_BPGSP6 ] [ P0 :/CELL/CYTOPLASM:BPGSP_B23PG 1 ];
		k10	1979.0;
		k11	0.01;
	}
	
	Process UniBiBPGSP7FluxProcess( BPGSP7 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSP_B23PG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:AC_BPGSP7 ] [ P0 :/CELL/CYTOPLASM:BPGSP 1 ] [ P1 :/CELL/CYTOPLASM:f23DPG 1 ];
		k12	1000.0;
		k13	1800000.0;
	}
	
	Process BiUniBPGSP8FluxProcess( BPGSP8 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP -1 ] [ S1 :/CELL/CYTOPLASM:Pi -1 ] [ E0 :/CELL/CYTOPLASM:AC_BPGSP8 ] [ P0 :/CELL/CYTOPLASM:BPGSPP_Phos 1 ];
		k14	1000000000.0;
		k15	610000.0;
	}
	
	Process UniBiBPGSP9FluxProcess( BPGSP9 )
	{
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:BPGSPP_Phos -1 ] [ E0 :/CELL/CYTOPLASM:AC_BPGSP9 ] [ P0 :/CELL/CYTOPLASM:BPGSP 1 ] [ P1 :/CELL/CYTOPLASM:Pi 2 ];
		k16	0.19;
	}
	
	Process RBCMichaelisUniUniProcess( E_6PGLase )
	{
		Km	0.079882812;
		Name	6;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:GL6P -1 ] [ C0 :/CELL/CYTOPLASM:E_6PGLase ] [ E0 :/CELL/CYTOPLASM:AC_6PGLase ] [ P0 :/CELL/CYTOPLASM:GO6P 1 ];
		Vm	2251.8;
	}
	
	Process GL6PDHProcess( E_6PGODH )
	{
		Name	6;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADP -1 ] [ S1 :/CELL/CYTOPLASM:GO6P -1 ] [ C0 :/CELL/CYTOPLASM:E_6PGODH ] [ E0 :/CELL/CYTOPLASM:AC_6PGODH ] [ P0 :/CELL/CYTOPLASM:CO2 ] [ P3 :/CELL/CYTOPLASM:CO2 ] [ P1 :/CELL/CYTOPLASM:RU5P 1 ] [ P2 :/CELL/CYTOPLASM:NADPH 1 ];
		k1	2400000.0;
		k10	225000.0;
		k11	300.0;
		k12	4950000.0;
		k2	410.0;
		k3	2000000000.0;
		k4	26000.0;
		k5	48.0;
		k6	30.0;
		k7	630.0;
		k8	36000.0;
		k9	800.0;
	}
	
	Process RBCMichaelisUniUniProcess( E_ADA )
	{
		Km	0.052;
		Name	Adenosine_deaminase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:ADO -1 ] [ C0 :/CELL/CYTOPLASM:E_ADA ] [ E0 :/CELL/CYTOPLASM:AC_ADA ] [ P0 :/CELL/CYTOPLASM:INO 1 ];
		Vm	20.0;
	}
	
	Process MichaelisBiBiFluxProcess( E_ADPRT )
	{
		KmA	0.0023;
		KmB	0.0195;
		Name	Adenine_phosphoribosyl_transferase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:ADE -1 ] [ S1 :/CELL/CYTOPLASM:PRPP -1 ] [ C0 :/CELL/CYTOPLASM:E_ADPRT ] [ E0 :/CELL/CYTOPLASM:AC_ADPRT ] [ P0 :/CELL/CYTOPLASM:fAMP 1 ] [ P1 :/CELL/CYTOPLASM:Pi 2 ];
		Vm	0.078;
	}
	
	Process OrderedBiBiSimpleFluxProcess( E_AK )
	{
		KiA	0.54;
		KmA	1.75;
		KmB	27.0;
		Name	Adenosine_kinase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:ADO -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_AK ] [ E0 :/CELL/CYTOPLASM:AC_AK ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ] [ P1 :/CELL/CYTOPLASM:fAMP 1 ];
		Vm	0.55;
	}
	
	Process ALDmodify2Process( E_ALD )
	{
		KiA	19.8;
		KiI	1500.0;
		KiQ	11.0;
		KmA	16.5;
		KmP	190.0;
		KmQ	35.0;
		Name	Aldolase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:FDP -1 ] [ C0 :/CELL/CYTOPLASM:E_ALD ] [ E0 :/CELL/CYTOPLASM:AC_ALD ] [ E1 :/CELL/CYTOPLASM:f23DPG ] [ P0 :/CELL/CYTOPLASM:GA3P 1 ] [ P1 :/CELL/CYTOPLASM:DHAP 1 ];
		kcatf	68.0;
		kcatr	234.0;
	}
	
	Process RBCMichaelisUniUniProcess( E_AMPDA )
	{
		Km	0.8;
		Name	AMP_deaminase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:fAMP -1 ] [ C0 :/CELL/CYTOPLASM:E_AMPDA ] [ E0 :/CELL/CYTOPLASM:AC_AMPDA ] [ P0 :/CELL/CYTOPLASM:IMP 1 ];
		Vm	0.01;
	}
	
	Process RBCMassActionProcess( E_AMPase )
	{
		Name	AMP_phosphohydrolase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:fAMP -1 ] [ C0 :/CELL/CYTOPLASM:E_AMPase ] [ E0 :/CELL/CYTOPLASM:AC_AMPase ] [ P0 :/CELL/CYTOPLASM:ADO 1 ] [ P1 :/CELL/CYTOPLASM:Pi 1 ];
		k	1.58;
	}
	
	Process APKaknewProcess( E_APK )
	{
		KmA	0.01;
		KmB	0.1;
		KmP	0.11;
		KmQ	0.067;
		Name	Adenylate_kinase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:fADP -1 ] [ S1 :/CELL/CYTOPLASM:MgADP -1 ] [ C0 :/CELL/CYTOPLASM:E_APK ] [ E0 :/CELL/CYTOPLASM:AC_APK ] [ P2 :/CELL/CYTOPLASM:Mg ] [ P0 :/CELL/CYTOPLASM:fAMP 1 ] [ P1 :/CELL/CYTOPLASM:MgATP 1 ];
		kcatf	2080.0;
		kcatr	3800.0;
	}
	
	Process RBCMassActionProcess( E_ATPase )
	{
		Name	ATP_phosphohydrolase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_ATPase ] [ E0 :/CELL/CYTOPLASM:AC_ATPase ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ] [ P1 :/CELL/CYTOPLASM:Pi 1 ];
		k	0.356;
	}
	
	Process ENmodify2Process( E_EN )
	{
		KiMg	460.0;
		KiPEP	310.0;
		KiPG	140.0;
		KmMg	46.0;
		KmPEP	310.0;
		KmPG	140.0;
		Name	Enolase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:_2PG -1 ] [ C0 :/CELL/CYTOPLASM:E_EN ] [ E0 :/CELL/CYTOPLASM:AC_EN ] [ E1 :/CELL/CYTOPLASM:Mg ] [ P0 :/CELL/CYTOPLASM:PEP 1 ];
		kcatf	190.0;
		kcatr	50.0;
	}
	
	Process G6PDHak_GSH_Process( E_G6PDH )
	{
		K_ATP	749.0;
		K_DPG	2289.0;
		K_G6P	66.7;
		K_GSSG	0.0;
		K_NADP	3.67;
		K_NADPH	3.12;
		Name	Glucose_6_phosphate_dehydrogenase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADP -1 ] [ S1 :/CELL/CYTOPLASM:G6P -1 ] [ C0 :/CELL/CYTOPLASM:E_G6PDH ] [ E0 :/CELL/CYTOPLASM:AC_G6PDH ] [ E1 :/CELL/CYTOPLASM:MgATP ] [ E2 :/CELL/CYTOPLASM:f23DPG ] [ E3 :/CELL/CYTOPLASM:GSH ] [ E4 :/CELL/CYTOPLASM:GSSG ] [ P0 :/CELL/CYTOPLASM:GL6P 1 ] [ P1 :/CELL/CYTOPLASM:NADPH 1 ];
		Vm	64.0;
	}
	
	Process TriBiGAPDH_band3_FluxProcess( E_GAPDH )
	{
		KiB13PG	0.01;
		KiGraP	0.065;
		KiNAD	4.5e-05;
		KiNADH	1e-05;
		KiPhos	0.00316;
		KidB13PG	1e-06;
		KidGraP	3.1e-05;
		KmB13PG	6.71e-07;
		KmGraP	9.5e-05;
		KmNAD	4.5e-05;
		KmNADH	3.3e-06;
		KmPhos	0.00316;
		Name	"Glyceraldehyde Phosphate Dehydrogenase";
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:GA3P -1 ] [ S1 :/CELL/CYTOPLASM:Pi -1 ] [ S2 :/CELL/CYTOPLASM:NAD -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:_13DPG 1 ] [ P1 :/CELL/CYTOPLASM:NADH 1 ][E1 :/CELL/CYTOPLASM:E_GAPDH 0];
		kcatf	232.0;
		kcatr	2765.0;
	}
	
	Process GSHSProcess( E_GSH_S )
	{
		KmA	0.99;
		KmB	1.37;
		KmC	0.23;
		Name	Glutathione_synthetase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:L_GC -1 ] [ S2 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_GSH_S ] [ E0 :/CELL/CYTOPLASM:AC_GSH_S ] [ S1 :/CELL/CYTOPLASM:glycine ] [ P0 :/CELL/CYTOPLASM:GSH 1 ] [ P1 :/CELL/CYTOPLASM:MgADP 1 ] [ P2 :/CELL/CYTOPLASM:Pi 1 ];
		Vmf	88.4;
		alpha	2.6;
	}
	
	Process GSSGRProcess( E_GSSGR )
	{
		Name	Glutathione_reductase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADPH -1 ] [ S1 :/CELL/CYTOPLASM:GSSG -1 ] [ C0 :/CELL/CYTOPLASM:E_GSSGR ] [ E0 :/CELL/CYTOPLASM:AC_GSSGR ] [ P1 :/CELL/CYTOPLASM:NADP 1 ] [ P0 :/CELL/CYTOPLASM:GSH 2 ];
		k1	85000000.0;
		k10	50000000.0;
		k11	7000.0;
		k12	100000000.0;
		k2	510.0;
		k3	100000000.0;
		k4	560000.0;
		k5	810.0;
		k6	1000.0;
		k7	1000000.0;
		k8	50000000.0;
		k9	1000000.0;
	}
	
	Process GSSGtransportProcess( E_GSSG_transport )
	{
		Km1	7.1;
		Km2	0.1;
		Kmatp	0.63;
		Name	GSSG_transport;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:GSSG -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_GSSG_transport ] [ E0 :/CELL/CYTOPLASM:AC_GSSG_transport ] [ E1 :/CELL/CYTOPLASM:MgATP ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ] [ P1 :/CELL/CYTOPLASM:Pi 1 ];
		Vmax1	20.0;
		Vmax2	190.0;
	}
	
	Process MichaelisBiBiFluxProcess( E_HGPRT )
	{
		KmA	0.005;
		KmB	0.22;
		Name	Hypoxanthine_guanine_phosphoryl_transferase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:PRPP -1 ] [ S1 :/CELL/CYTOPLASM:HXi -1 ] [ C0 :/CELL/CYTOPLASM:E_HGPRT ] [ E0 :/CELL/CYTOPLASM:AC_HGPRT ] [ P1 :/CELL/CYTOPLASM:IMP 1 ] [ P0 :/CELL/CYTOPLASM:Pi 2 ];
		Vm	0.201;
	}
	
	Process HK_Kuchel_GSH_Process( E_HK )
	{
		HK	2.5e-08;
		K_GSSG	0.0;
		KdiB23PG	0.0027;
		KdiGSH	0.003;
		KdiGlc16P2	1e-05;
		KdiGlc6P	1e-05;
		KiGlc	4.7e-05;
		KiGlc6P	4.7e-05;
		KiMgADP	0.001;
		KiMgATP	0.001;
		KmMgADP	0.001;
		KmMgATP	0.001;
		Name	Hexokinase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:f23DPG ] [ E2 :/CELL/CYTOPLASM:GDP ] [ E3 :/CELL/CYTOPLASM:GSH ] [ E4 :/CELL/CYTOPLASM:GSSG ] [ S0 :/CELL/CYTOPLASM:GLC ] [ P0 :/CELL/CYTOPLASM:G6P 1 ] [ P1 :/CELL/CYTOPLASM:MgADP 1 ];
		kcatf	180.0;
		kcatr	1.16;
	}
	
	Process RBCMassActionProcess( E_IMPase )
	{
		Name	Inosine_monophosphatase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:IMP -1 ] [ C0 :/CELL/CYTOPLASM:E_IMPase ] [ E0 :/CELL/CYTOPLASM:AC_IMPase ] [ P0 :/CELL/CYTOPLASM:INO 1 ] [ P1 :/CELL/CYTOPLASM:Pi 1 ];
		k	0.09;
	}
	
	Process LDH0605Process( E_LDH )
	{
		Kcatf	458.0;
		Kcatr	115.0;
		KiLAC	7330.0;
		KiNAD	503.0;
		KiNADH	2.45;
		KiaPYR	228.0;
		KibPYR	101.0;
		KmLAC	1070.0;
		KmNAD	107.0;
		KmNADH	8.44;
		KmPYR	137.0;
		Name	Lactate_dehydrogenase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:PYRi -1 ] [ S1 :/CELL/CYTOPLASM:NADH -1 ] [ C0 :/CELL/CYTOPLASM:E_LDH ] [ E0 :/CELL/CYTOPLASM:AC_LDH ] [ E1 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:LACi 1 ] [ P1 :/CELL/CYTOPLASM:NAD 1 ];
	}
	
	Process RBC_BiBiLDHPFluxProcess( E_LDH2 )
	{
		KmLac	0.000414;
		KmPyr	0.000414;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:PYRi -1 ] [ S1 :/CELL/CYTOPLASM:NADPH -1 ] [ E0 :/CELL/CYTOPLASM:AC_LDH2 ] [ P0 :/CELL/CYTOPLASM:LACi 1 ] [ P1 :/CELL/CYTOPLASM:NADP 1 ];
		kf	0.00346;
		kr	5.43e-07;
	}
	
	Process L_GCSkh3Process( E_L_GCS )
	{
		Ki	3.4;
		KmA	0.4;
		KmB	1.8;
		KmC	0.1;
		Name	L_glutamyl_cysteine_synthetase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S2 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_L_GCS ] [ E0 :/CELL/CYTOPLASM:AC_L_GCS ] [ E1 :/CELL/CYTOPLASM:GSH ] [ S0 :/CELL/CYTOPLASM:glutamate ] [ S1 :/CELL/CYTOPLASM:cysteine ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ] [ P1 :/CELL/CYTOPLASM:L_GC 1 ] [ P2 :/CELL/CYTOPLASM:Pi 1 ];
		Vmf	50.0;
		alpha	0.2;
	}
	
	Process MassActionFluxProcess( E_NADHox )
	{
		Name	NADHox;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADH -1 ] [ P0 :/CELL/CYTOPLASM:NAD 1 0 ];
		k	0.0;
	}
	
	Process BiBiPFKak_GSH_FluxProcess( E_PFK )
	{
		KRAMP	3.5e-05;
		KRGlc16P2	1.51e-05;
		KRPhos	0.000431;
		KTATP	9.8e-06;
		KTB23PG	0.00144;
		KTMg	0.00044;
		K_GSSG	0.0;
		Ka	8.91250938134e-08;
		KmFru16P2	0.00042;
		KmFru6P	0.00027;
		KmMgADP	0.00054;
		KmMgATP	6.8e-05;
		Name	"Glucose Phosphate Isomerase";
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:F6P -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_PFK ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:fATP ] [ E2 :/CELL/CYTOPLASM:Mg ] [ E3 :/CELL/CYTOPLASM:f23DPG ] [ E4 :/CELL/CYTOPLASM:fAMP ] [ E5 :/CELL/CYTOPLASM:Pi ] [ E6 :/CELL/CYTOPLASM:GDP ] [ E7 :/CELL/CYTOPLASM:AC_PFK ] [ E8 :/CELL/CYTOPLASM:GSH ] [ E9 :/CELL/CYTOPLASM:GSSG ] [ P0 :/CELL/CYTOPLASM:FDP 1 ] [ P1 :/CELL/CYTOPLASM:MgADP 1 ];
		kcatf	822.0;
		kcatr	36.0;
		n	2.0;
	}
	
	Process MichaelisUniUniReversiblemodifyProcess( E_PGI )
	{
		KmA	181.0;
		KmP	71.0;
		Name	Phosphoglucoisomerase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:G6P -1 ] [ C0 :/CELL/CYTOPLASM:E_PGI ] [ E0 :/CELL/CYTOPLASM:AC_PGI ] [ P0 :/CELL/CYTOPLASM:F6P 1 ];
		kcatf	1470.0;
		kcatr	1760.0;
	}
	
	Process BiBiPGKFluxProcess( E_PGK )
	{
		KiB13PG	1.6e-06;
		KiMgADP	8e-05;
		KiMgATP	0.00013;
		KiP3GA	0.000205;
		KmB13PG	2e-06;
		KmMgADP	0.0001;
		KmMgATP	0.001;
		KmP3GA	0.0011;
		Name	"Phosphoglycerate Kinase";
		PGK	2.74e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:_13DPG -1 ] [ S1 :/CELL/CYTOPLASM:MgADP -1 ] [ P0 :/CELL/CYTOPLASM:_3PG 1 ] [ P1 :/CELL/CYTOPLASM:MgATP 1 ];
		kcatf	2290.0;
		kcatr	917.0;
	}
	
	Process UniUniPGMFluxProcess( E_PGM )
	{
		KmP2GA	4.6e-05;
		KmP3GA	0.000168;
		Name	"Phosphoglycerate Mutase";
		PGM	4.1e-07;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:_3PG -1 ] [ P0 :/CELL/CYTOPLASM:_2PG 1 ];
		kcatf	795.0;
		kcatr	714.0;
	}
	
	Process BiBiPKFluxProcess( E_PK )
	{
		KRF16P2	5e-06;
		KRG16P2	0.0001;
		KRMgADP	0.000474;
		KRMgATP	0.003;
		KRPEP	0.000225;
		KRPyr	0.002;
		KTATP	0.00339;
		PK	8.7e-08;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:PEP -1 ] [ S1 :/CELL/CYTOPLASM:MgADP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:fATP ] [ E2 :/CELL/CYTOPLASM:FDP ] [ E3 :/CELL/CYTOPLASM:GDP ] [ P0 :/CELL/CYTOPLASM:PYRi 1 ] [ P1 :/CELL/CYTOPLASM:MgATP 1 ];
		kcatf	1386.0;
		kcatr	3.26;
	}
	
	Process MassActionReversibleProcess( E_PNPase )
	{
		Kma	1110.0;
		Kmd	100.0;
		Name	Purine_nucleoside_phosphorylase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:INO -1 ] [ S1 :/CELL/CYTOPLASM:Pi -1 ] [ P0 :/CELL/CYTOPLASM:HXi 1 ] [ P1 :/CELL/CYTOPLASM:R1P 1 ];
	}
	
	
	Process MassActionReversibleProcess( E_PRM )
	{
		Kma	7.25;
		Kmd	100.0;
		Name	Phosphoribomutase_foward;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:R1P -1 ] [ P0 :/CELL/CYTOPLASM:R5P 1 ];
	}
	
	Process PRPPProcess( E_PRPPsyn )
	{
		Kamp	0.275;
		Katp	0.17;
		Keq	28.6;
		Kprpp	0.09;
		Kr5p	0.65;
		Kv	7.5;
		Name	Phosphoribosyl_pyrophosphate_synthetase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:R5P -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/CYTOPLASM:E_PRPPsyn ] [ E0 :/CELL/CYTOPLASM:AC_PRPPsyn ] [ P0 :/CELL/CYTOPLASM:PRPP 1 ] [ P1 :/CELL/CYTOPLASM:fAMP 1 ] [ P2 :/CELL/CYTOPLASM:Mg 1 ];
		Vm	0.554;
		Vr	0.0738666666667;
	}
	
	Process UniUniRU5PFluxProcess( E_R5PI )
	{
		Priority	0;
		Ru5P	1.42e-05;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:RU5P -1 ] [ P0 :/CELL/CYTOPLASM:R5P 1 ];
		k1	60900.0;
		k2	33.3;
		k3	14.2;
		k4	21600.0;
	}
	
	Process PingPongBiBimodify2Process( E_TA )
	{
		Name	Transaldolase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:S7P -1 ] [ S1 :/CELL/CYTOPLASM:GA3P -1 ] [ C0 :/CELL/CYTOPLASM:E_TA ] [ E0 :/CELL/CYTOPLASM:AC_TA ] [ P0 :/CELL/CYTOPLASM:E4P 1 ] [ P1 :/CELL/CYTOPLASM:F6P 1 ];
		k1	21600.0;
		k2	45.3;
		k3	16.3;
		k4	30000.0;
		k5	490000.0;
		k6	60.0;
		k7	17.0;
		k8	79000.0;
	}
	
	Process PingPongBiBimodify2Process( E_TK1 )
	{
		Name	Transketolase_I;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:X5P -1 ] [ S1 :/CELL/CYTOPLASM:R5P -1 ] [ C0 :/CELL/CYTOPLASM:E_TK1 ] [ E0 :/CELL/CYTOPLASM:AC_TK1 ] [ P0 :/CELL/CYTOPLASM:GA3P 1 ] [ P1 :/CELL/CYTOPLASM:S7P 1 ];
		k1	216000.0;
		k2	38.0;
		k3	34.0;
		k4	156000.0;
		k5	329000.0;
		k6	175.0;
		k7	40.0;
		k8	44800.0;
	}
	
	Process PingPongBiBimodify2Process( E_TK2 )
	{
		Name	Transketolase_II;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:X5P -1 ] [ S1 :/CELL/CYTOPLASM:E4P -1 ] [ C0 :/CELL/CYTOPLASM:E_TK2 ] [ E0 :/CELL/CYTOPLASM:AC_TK2 ] [ P0 :/CELL/CYTOPLASM:GA3P 1 ] [ P1 :/CELL/CYTOPLASM:F6P 1 ];
		k1	216000.0;
		k2	38.0;
		k3	34.0;
		k4	156000.0;
		k5	2240000.0;
		k6	175.0;
		k7	40.0;
		k8	21300.0;
	}
	
	Process MichaelisUniUniReversiblemodifyProcess( E_TPI )
	{
		KmA	162.4;
		KmP	446.0;
		Name	Triose_Phosphate_Isomerase;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:DHAP -1 ] [ C0 :/CELL/CYTOPLASM:E_TPI ] [ E0 :/CELL/CYTOPLASM:AC_TPI ] [ P0 :/CELL/CYTOPLASM:GA3P 1 ];
		kcatf	1280.0;
		kcatr	14560.0;
	}
	
	Process UniUniRU5PFluxProcess( E_X5PI )
	{
		Priority	0;
		Ru5P	4.22e-06;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:RU5P -1 ] [ P0 :/CELL/CYTOPLASM:X5P 1 ];
		k1	3910000.0;
		k2	438.0;
		k3	305.0;
		k4	1490000.0;
	}
	
	Process BiUniMgBPGFluxProcess( Mg13DPG )
	{
		Kh2bpg	4270000.0;
		Khbpg	162000000.0;
		Kkbpg	85.1;
		Kkhbpg	8.9;
		Kmgbpg	7410.0;
		Kmghbpg	513.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:_13DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:Mg13DPG 1 ];
		kmgbpga	228000.0;
		kmgbpgd	1200.0;
	}
	
	Process BiUniMgBPGFluxProcess( Mg23DPG )
	{
		Kh2bpg	4270000.0;
		Khbpg	162000000.0;
		Kkbpg	85.1;
		Kkhbpg	8.9;
		Kmgbpg	7410.0;
		Kmghbpg	513.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:f23DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:Mg23DPG 1 ];
		kmgbpga	804000.0;
		kmgbpgd	1200.0;
	}
	
	Process BiUniMgADPFluxProcess( MgADP )
	{
		Khadp	5420000.0;
		Kkadp	4.8;
		Kmgadp	3290.0;
		Kmghadp	107.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:fADP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ];
		kmgadpa	1711.2;
		kmgadpd	1200.0;
	}
	
	Process BiUniBindingProcess( MgAMP )
	{
		Kma	54054.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:fAMP -1 ] [ P0 :/CELL/CYTOPLASM:MgAMP 1 ];
	}
	
	Process BiUniMgATPFluxProcess( MgATP )
	{
		Khatp	9070000.0;
		Kkatp	14.0;
		Kmgatp	43200.0;
		Kmghatp	748.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:fATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:MgATP 1 ];
		kmgatpa	2620.8;
		kmgatpd	1200.0;
	}
	
	Process BiUniMgFru16P2FluxProcess( MgFru16P2 )
	{
		Kh2f	1120000.0;
		Khf	7560000.0;
		Kkf	10.7;
		Kkhf	3.3;
		Kmgfru16p2	363.0;
		Kmghf	89.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:FDP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:MgFDP 1 ];
		kmgf16p2a	480000.0;
		kmgf16p2d	1200.0;
	}
	
	Process BiUniMgFru16P2FluxProcess( MgGlc16P2 )
	{
		Kh2f	1120000.0;
		Khf	7560000.0;
		Kkf	10.7;
		Kkhf	3.3;
		Kmgfru16p2	363.0;
		Kmghf	89.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:GDP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:MgGDP 1 ];
		kmgf16p2a	480000.0;
		kmgf16p2d	1200.0;
	}
	
	Process BiUniMgPhosFluxProcess( MgPhos )
	{
		Khphos	5680000.0;
		Kkphos	3.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Mg -1 ] [ S1 :/CELL/CYTOPLASM:Pi -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:Ki ] [ P0 :/CELL/CYTOPLASM:MgPi 1 ];
		kmgphosa	40800.0;
		kmgphosd	1200.0;
	}
	
	Process MassActionFluxProcess( NADPHox )
	{
		Name	NADPHox;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADPH -1 ] [ P0 :/CELL/CYTOPLASM:NADP 1 0 ];
		k	0.0;
	}
	
	Process UniUniOXFluxProcess( OX )
	{
		Name	"Glutathione Oxidation";
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:GSH -2 ] [ P0 :/CELL/CYTOPLASM:GSSG 1 ];
		k	2.38e-05;
	}
	
	Process MassActionFluxProcess( OXNADH )
	{
		Name	"Non-Glycolytic NADH Consumption";
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:NADH -1 ] [ P0 :/CELL/CYTOPLASM:NAD 1 0 ];
		k	0.0163;
	}
	
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
	
	Process BiUniPortableBindingProcess( band3ALD )
	{
		Kma	1200000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:E_ALD -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3ALD 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3GAPDH )
	{
		Kma	2400000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:E_GAPDH -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3GAPDH 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3PFK )
	{
		Kma	6000000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:E_PFK -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3PFK 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHb )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHb -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHb 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHb13DPG )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHb13DPG -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHb13DPG 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHb23DPG )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHb23DPG -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHb23DPG 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHbADP )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHbADP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHbADP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHbATP )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHbATP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHbATP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHbFDP )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHbFDP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHbFDP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHbGDP )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHbGDP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHbGDP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3deoxyHbMgATP )
	{
		Kma	12000000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:deoxyHbMgATP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3deoxyHbMgATP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHb )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHb -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHb 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHb13DPG )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHb13DPG -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHb13DPG 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHb23DPG )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHb23DPG -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHb23DPG 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHbADP )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHbADP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHbADP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHbATP )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHbATP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHbATP 1 ];
	}
	
	Process BiUniPortableBindingProcess( band3oxyHbMgATP )
	{
		Kma	120000.0;
		Kmd	1200.0;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:band3 -1 ] [ S1 :/CELL/CYTOPLASM:oxyHbMgATP -1 ] [ E0 :/CELL/CYTOPLASM:band3_ka ] [ E1 :/CELL/CYTOPLASM:band3_kd ] [ P0 :/CELL/CYTOPLASM:band3oxyHbMgATP 1 ];
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHb13DPG )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:_13DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHb13DPG 1 ];
		ka	1860000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHb23DPG )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:f23DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHb23DPG 1 ];
		ka	6000000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHbADP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:fADP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHbADP 1 ];
		ka	1440000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHbATP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:fATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHbATP 1 ];
		ka	3120000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHbFDP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:FDP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHbFDP 1 ];
		ka	1212000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHbGDP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:GDP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHbGDP 1 ];
		ka	1212000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( deoxyHbMgATP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:deoxyHbMgATP 1 ];
		ka	168000.0;
		kd	1200.0;
	}
	
	Process DistributionTESTProcess( distributionHb )
	{
		K2	2.4e-05;
		K2dd	1e-06;
		K3	2.4e-05;
		K3dd	5e-06;
		K4dd	677000000000.0;
		K5dd	7.2e-08;
		K6dd	8.4e-09;
		Kd	1200.0;
		Priority	0;
		StepperID	DE1;
                VariableReferenceList	[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ E1 :/CELL/CYTOPLASM:T ] [ E2 :/CELL/CYTOPLASM:PO2 ] [ E3 :/CELL/CYTOPLASM:PCO2 ] [ E4 :/CELL/CYTOPLASM:f23DPG ] [ P0 :/CELL/CYTOPLASM:oxyHb 1 ]
[E5 :/CELL/CYTOPLASM:oxyHbMgATP]
[E6 :/CELL/CYTOPLASM:oxyHbATP]
[E7 :/CELL/CYTOPLASM:oxyHbADP]
[E8 :/CELL/CYTOPLASM:oxyHb23DPG]
[E9 :/CELL/CYTOPLASM:oxyHb13DPG]
[E10 :/CELL/CYTOPLASM:band3oxyHbMgATP]
[E11 :/CELL/CYTOPLASM:band3oxyHbATP]
[E12 :/CELL/CYTOPLASM:band3oxyHbADP]
[E13 :/CELL/CYTOPLASM:band3oxyHb23DPG]
[E14 :/CELL/CYTOPLASM:band3oxyHb13DPG]
[E15 :/CELL/CYTOPLASM:band3oxyHb]
[E16 :/CELL/CYTOPLASM:oxyHb];
		Wpl	0.94;
		Wrbc	0.65;
		n	2.7;
	}


	Process BiUniHbBindingFluxProcess( oxyHb13DPG )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:oxyHb -1 ] [ S1 :/CELL/CYTOPLASM:_13DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:oxyHb13DPG 1 ];
		ka	380000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( oxyHb23DPG )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:oxyHb -1 ] [ S1 :/CELL/CYTOPLASM:f23DPG -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:oxyHb23DPG 1 ];
		ka	300000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( oxyHbADP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:oxyHb -1 ] [ S1 :/CELL/CYTOPLASM:fADP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:oxyHbADP 1 ];
		ka	300000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( oxyHbATP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:oxyHb -1 ] [ S1 :/CELL/CYTOPLASM:fATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:oxyHbATP 1 ];
		ka	432000.0;
		kd	1200.0;
	}
	
	Process BiUniHbBindingFluxProcess( oxyHbMgATP )
	{
		Kahb	1e-06;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:oxyHb -1 ] [ S1 :/CELL/CYTOPLASM:MgATP -1 ] [ E0 :/CELL/CYTOPLASM:pHi ] [ P0 :/CELL/CYTOPLASM:oxyHbMgATP 1 ];
		ka	46800.0;
		kd	1200.0;
	}
	
	
}

System System( /CELL/MEMBRANE )
{
	Name	The;
	StepperID	DE1;

	Variable Variable( AC_ADEtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ADEtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_ADOtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_ADOtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_HXtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_HXtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_INOtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_INOtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_K_Leak )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_K_Leak;
		Value	1000.0;
	}
	
	Variable Variable( AC_LACtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_LACtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_NaK_Pump )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_NaK_Pump;
		Value	1000.0;
	}
	
	Variable Variable( AC_Na_Leak )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_Na_Leak;
		Value	1000.0;
	}
	
	Variable Variable( AC_PYRtr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_PYRtr;
		Value	1000.0;
	}
	
	Variable Variable( AC_Pitr )
	{
		Fixed	0;
		Name	Activity_coefficient_of_E_Pitr;
		Value	1000.0;
	}
	
	Variable Variable( E_ADEtr )
	{
		Fixed	0;
		Name	adenosine_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_ADOtr )
	{
		Fixed	0;
		Name	adenosine_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_HXtr )
	{
		Fixed	0;
		Name	Hypoxanthine_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_INOtr )
	{
		Fixed	0;
		Name	inosine_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_K_Leak )
	{
		Fixed	0;
		Name	Leak_of_potassium;
		Value	1.0;
	}
	
	Variable Variable( E_LACtr )
	{
		Fixed	0;
		Name	Lactate_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_NaK_Pump )
	{
		Fixed	0;
		Name	Pump;
		Value	1.0;
	}
	
	Variable Variable( E_Na_Leak )
	{
		Fixed	0;
		Name	Leak_of_sodium;
		Value	1.0;
	}
	
	Variable Variable( E_PYRtr )
	{
		Fixed	0;
		Name	Pyruvate_transport_process;
		Value	1.0;
	}
	
	Variable Variable( E_Pitr )
	{
		Fixed	0;
		Name	Pi_transport_process;
		Value	1.0;
	}

	Process NUCtrProcess( E_ADEtr )
	{
		Km	2.6;
		Name	adenine_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:ADE -1 ] [ C0 :/CELL/MEMBRANE:E_ADEtr ] [ E0 :/CELL/MEMBRANE:AC_ADEtr ] [ P0 :/ENVIRONMENT:ADEe ];
		Vm	90.0;
	}
	
	Process NUCtrProcess( E_ADOtr )
	{
		Km	0.12;
		Name	adenosine_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:ADO -1 ] [ C0 :/CELL/MEMBRANE:E_ADOtr ] [ E0 :/CELL/MEMBRANE:AC_ADOtr ] [ P0 :/ENVIRONMENT:ADOe ];
		Vm	61.2;
	}
	
	Process HXTR2Process( E_HXtr )
	{
		Ki	0.012;
		Km	0.4;
		Kmin	0.18;
		Name	Hypoxanthine_transport_process;
		Pm	37.8;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:HXi -1 ] [ C0 :/CELL/MEMBRANE:E_HXtr ] [ E0 :/CELL/MEMBRANE:AC_HXtr ] [ E1 :/ENVIRONMENT:ADEe ] [ P0 :/ENVIRONMENT:HXe ];
		Vm	151.6;
		Vmin	100.8;
	}
	
	Process NUCtrProcess( E_INOtr )
	{
		Km	0.12;
		Name	inosine_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:INO -1 ] [ C0 :/CELL/MEMBRANE:E_INOtr ] [ E0 :/CELL/MEMBRANE:AC_INOtr ] [ P0 :/ENVIRONMENT:INOe ];
		Vm	61.2;
	}
	
	Process LeakageProcess( E_K_Leak )
	{
		Km	4.0;
		Kx	0.00635;
		Name	Leak_of_potassium;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ C0 :/CELL/MEMBRANE:E_K_Leak ] [ E0 :/CELL/MEMBRANE:AC_K_Leak ] [ S0 :/ENVIRONMENT:Ke ] [ P0 :/CELL/CYTOPLASM:Ki 1 ];
		Vm	3.12;
		r	0.62;
		z	1.0;
	}
	
	Process IonTransakProcess( E_LACtr )
	{
		Name	Lactate_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:LACi -1 ] [ C0 :/CELL/MEMBRANE:E_LACtr ] [ E0 :/CELL/MEMBRANE:AC_LACtr ] [ P0 :/ENVIRONMENT:LACe ];
		k0	0.00733;
		k1	0.00506;
	}
	
	Process PumpMgProcess( E_NaK_Pump )
	{
		B1	0.0617;
		B2	0.1328;
		B3	6.2672;
		Km	0.764;
		Name	Pump2;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S2 :/CELL/CYTOPLASM:Nai -3 ] [ S0 :/CELL/CYTOPLASM:MgATP -1 ] [ C0 :/CELL/MEMBRANE:E_NaK_Pump ] [ E0 :/CELL/MEMBRANE:AC_NaK_Pump ] [ E1 :/CELL/CYTOPLASM:MgATP ] [ P2 :/ENVIRONMENT:Nae ] [ S1 :/ENVIRONMENT:Ke ] [ P0 :/CELL/CYTOPLASM:MgADP 1 ] [ P3 :/CELL/CYTOPLASM:Pi 1 ] [ P1 :/CELL/CYTOPLASM:Ki 2 ];
		Vm	2.32;
		k2k1	0.0082;
		k3k1	0.0501;
		z	0.7114;
	}
	
	Process LeakageProcess( E_Na_Leak )
	{
		Km	21.0;
		Kx	0.00706;
		Name	Leak_of_sodium;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ C0 :/CELL/MEMBRANE:E_Na_Leak ] [ E0 :/CELL/MEMBRANE:AC_Na_Leak ] [ S0 :/ENVIRONMENT:Nae ] [ P0 :/CELL/CYTOPLASM:Nai 1 ];
		Vm	2.82;
		r	0.62;
		z	1.0;
	}
	
	Process IonTransakProcess( E_PYRtr )
	{
		Name	Pyruvate_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:PYRi -1 ] [ C0 :/CELL/MEMBRANE:E_PYRtr ] [ E0 :/CELL/MEMBRANE:AC_PYRtr ] [ P0 :/ENVIRONMENT:PYRe ];
		k0	0.0261;
		k1	0.018;
	}
	
	Process IonTransakProcess( E_Pitr )
	{
		Name	Pi_transport_process;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ S0 :/CELL/CYTOPLASM:Pi -1 ] [ C0 :/CELL/MEMBRANE:E_Pitr ] [ E0 :/CELL/MEMBRANE:AC_Pitr ] [ P0 :/ENVIRONMENT:Pie ];
		k0	0.000606;
		k1	0.00056;
	}
	
### Permiation of H202 ###

    Process ExpressionFluxProcess ( H2O2 )
    {
		Name	"External_H2O2";

		Expression "(9.983*S1.MolarConc*E0.Value * 6.02214 * 1.0e+23)";

		VariableReferenceList

			 [ S0 :/CELL/CYTOPLASM:Internal_H2O2 1]
			 [ S1 :/ENVIRONMENT:External_H2O2 0]
			 [ E0 :/CELL/CYTOPLASM:SIZE 0];
	}


}

	

System System( /ENVIRONMENT )
{
	Name	The;
	StepperID	DE1;

	Variable Variable( ADEe )
	{
		Fixed	0;
		Name	ADEe;
		Value	903320.505;
	}
	
	Variable Variable( ADOe )
	{
		Fixed	0;
		Name	ADOe;
		Value	4215.49569;
	}
	
	Variable Variable( HXe )
	{
		Fixed	0;
		Name	HXe;
		Value	162597.6909;
	}
	
	Variable Variable( INOe )
	{
		Fixed	0;
		Name	INOe;
		Value	7235.0000001;
	}
	
	Variable Variable( Ke )
	{
		Fixed	0;
		Name	Ke;
		Value	572102986.5;
	}
	
	Variable Variable( LACe )
	{
		Fixed	0;
		Name	LACe;
		Value	108398460.6;
	}
	
	Variable Variable( Nae )
	{
		Fixed	0;
		Name	Nae;
		Value	8129884545.0;
	}
	
	Variable Variable( PYRe )
	{
		Fixed	0;
		Name	PYRe;
		Value	4516603.0;
	}
	
	Variable Variable( Pie )
	{
		Fixed	0;
		Name	Pie;
		Value	66243503.7;
	}

	Variable Variable ( External_H2O2 )
	{
		Value	@( 1.0e-11 * Voli * N_A );
	}
	
	Variable Variable( SIZE )
	{
		Fixed	0;
		Name	Volume;
		Value	1e-13;
	}
	
	Process VariableVolumeProcess( SIZE )
	{
		Name	Volume;
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	[ E0 :/ENVIRONMENT:SIZE ];
	}
	
	
}


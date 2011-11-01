
# created by eml2em program
# from file: 0701-band3.eml, date: Sun Jul  2 08:23:17 2006
#

Stepper ODEStepper( DE1 )
{

	MaxStepInterval	100.0;
	MinStepInterval	1e-100;
}

Stepper PassiveStepper( Passive )
{
	MaxStepInterval	1.79769313486e+308;
	MinStepInterval	2.22507385851e-308;
	Priority	0;
	StepInterval	inf;
}

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

	Variable Variable( SIZE )
	{
		Fixed	0;
		Name	Volume;
		Value	1e-13;
	}
	
	@include( 'Activity_Variables.em' )

	@include( 'Enzyme_conc.em' )

	@include( 'TotalSumFluxProcesses.em' )
		
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
	
	Variable Variable( NADPHbound )
	{
		Fixed	0;
		Name	NADPH_bound;
		Value	5.9478389214e-317;
	}
	
	Variable Variable( NADPbound )
	{
		Fixed	0;
		Name	NADP_bound;
		Value	6.0190634249e-317;
	}
	
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

	Variable Variable( fixed23DPG )
	{
		Fixed	0;
		Name	fixed23DPG;
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

	@include( 'Processes.em' )

	@include( 'TotalSumProcesses.em' )
		
	
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
	
	@include( 'HbA.em' )
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


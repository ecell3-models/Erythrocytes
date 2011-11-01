	Process DistributionHbFProcess( distributionHb )
#	Process DistributionTESTProcess( distributionHb )
	{
		K2	2.4e-05;
		K2dd	1e-06;
		K3	2.4e-05;
		K3dd	5e-06;
		K4dd	1354000000000.0;
		K5dd	7.2e-08;
		K6dd	8.4e-09;
		Kd	1200.0;
		DPG_S	4.11;

		Priority	0;
		StepperID	DE1;
                VariableReferenceList	
		[ S0 :/CELL/CYTOPLASM:deoxyHb -1 ] 
		[ E0 :/CELL/CYTOPLASM:pHi ] 
		[ E1 :/CELL/CYTOPLASM:T ] 
		[ E2 :/CELL/CYTOPLASM:PO2 ] 
		[ E3 :/CELL/CYTOPLASM:PCO2 ] 
		[ E4 :/CELL/CYTOPLASM:f23DPG ] 
		[ P0 :/CELL/CYTOPLASM:oxyHb 1 ]
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
		ka	3000000.0;
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
	
	

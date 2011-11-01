	
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
		VariableReferenceList	
		[ S0 :/CELL/CYTOPLASM:_13DPG -1 ] 
		[ S1 :/CELL/CYTOPLASM:MgADP -1 ] 
		[ E0 :/CELL/CYTOPLASM:AC_PGK 0 ] 
		[ P0 :/CELL/CYTOPLASM:_3PG 1 ] 
		[ P1 :/CELL/CYTOPLASM:MgATP 1 ];
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
		VariableReferenceList	
		[ S0 :/CELL/CYTOPLASM:_3PG -1 ] 
		[ E0 :/CELL/CYTOPLASM:AC_PGM 0 ] 
		[ P0 :/CELL/CYTOPLASM:_2PG 1 ];

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
		VariableReferenceList	
		[ S0 :/CELL/CYTOPLASM:GSH -2 ] 
		[ E0 :/CELL/CYTOPLASM:AC_OX 0 ] 
		[ P0 :/CELL/CYTOPLASM:GSSG 1 ];

		k	2.38e-05;
	}
	
	Process MassActionFluxAConProcess( OXNADH )
	{
		Name	"Non-Glycolytic NADH Consumption";
		Priority	0;
		StepperID	DE1;
		VariableReferenceList	
		[ S0 :/CELL/CYTOPLASM:NADH -1 ] 
		[ E0 :/CELL/CYTOPLASM:AC_OXNADH 0 ] 
		[ P0 :/CELL/CYTOPLASM:NAD 1 0 ];
		k	0.0163;
	}

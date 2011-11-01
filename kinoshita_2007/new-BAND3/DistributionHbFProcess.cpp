#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"
#include "ContinuousProcess.hpp"
#include "System.hpp"
#include "Process.hpp"

#include "Stepper.hpp"

USE_LIBECS;
 
LIBECS_DM_CLASS( DistributionHbFProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( DistributionHbFProcess, Process ){
    
    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET_NO_LOAD_SAVE( Real, SHb_O2_c );
    PROPERTYSLOT_SET_GET_NO_LOAD_SAVE( Real, KHbO2_c );

    PROPERTYSLOT_SET_GET( Real,n  );
    PROPERTYSLOT_SET_GET( Real,Wrbc  );
    PROPERTYSLOT_SET_GET( Real,Wpl  );
    PROPERTYSLOT_SET_GET( Real,K2  );
    PROPERTYSLOT_SET_GET( Real,K2dd  );
    PROPERTYSLOT_SET_GET( Real,K3  );
    PROPERTYSLOT_SET_GET( Real,K3dd  );
    PROPERTYSLOT_SET_GET( Real,K5dd  );
    PROPERTYSLOT_SET_GET( Real,K6dd  );
    PROPERTYSLOT_SET_GET( Real,K4dd  );
    PROPERTYSLOT_SET_GET( Real,Kd  );

    PROPERTYSLOT_SET_GET( Real,DPG_S  );

    //    PROPERTYSLOT_GET( Real,Ka  );

  }
  
  DistributionHbFProcess()
    :
    n(0.0),
    Wrbc(0.0),
    Wpl(0.0),
    K2(0.0),
    K2dd(0.0),
    K3(0.0),
    K3dd(0.0),
    K5dd(0.0),
    K6dd(0.0),
    K4dd(0.0),
    Kd(0.0),
    DPG_S(0.0)
    {
      setSHb_O2_c( 0.0 ); // ducky 090616
      setKHbO2_c( 0.0 );
    }
  
  SIMPLE_SET_GET_METHOD( Real,n  );
  SIMPLE_SET_GET_METHOD( Real,Wrbc  );
  SIMPLE_SET_GET_METHOD( Real,Wpl  );
  SIMPLE_SET_GET_METHOD( Real,K2  );
  SIMPLE_SET_GET_METHOD( Real,K2dd  );
  SIMPLE_SET_GET_METHOD( Real,K3  );
  SIMPLE_SET_GET_METHOD( Real,K3dd  );
  SIMPLE_SET_GET_METHOD( Real,K5dd  );
  SIMPLE_SET_GET_METHOD( Real,K6dd  );
  SIMPLE_SET_GET_METHOD( Real,K4dd  );
  SIMPLE_SET_GET_METHOD( Real,Kd  );
  SIMPLE_SET_GET_METHOD( Real,DPG_S  );

  //  SIMPLE_GET_METHOD( Real,Ka  );                                                                                                 
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );
    E3 = getVariableReference( "E3" );
    E4 = getVariableReference( "E4" );
    E5 = getVariableReference( "E5" );
    E6 = getVariableReference( "E6" );
    E7 = getVariableReference( "E7" );
    E8 = getVariableReference( "E8" );
    E9 = getVariableReference( "E9" );
    E10 = getVariableReference( "E10" );
    E11 = getVariableReference( "E11" );
    E12 = getVariableReference( "E12" );
    E13 = getVariableReference( "E13" );
    E14 = getVariableReference( "E14" );
    E15 = getVariableReference( "E15" );
    E16 = getVariableReference( "E16" );

  }
  
  virtual void fire(){

    Real deoxyHbcomp = S0.getVariable()->getMolarConc();  
    Real oxyHbcomp = P0.getVariable()->getMolarConc();

    Real pHi    = E0.getVariable()->getValue();
    Real T = E1.getVariable()->getValue();
    Real PO2 = E2.getVariable()->getValue();
    Real PCO2 = E3.getVariable()->getValue();
    Real BPG = E4.getVariable()->getMolarConc();
    Real H = pow(10, -1*pHi); //H+(M)
    
    Real  aO2 = (1.37 - 0.0137*(T-37)+ 0.00058*(T-37)*(T-37))*0.000001/Wpl;
    Real  aCO2 = (3.07 - 0.057*(T-37)+ 0.002*(T-37)*(T-37))*0.00001/Wpl;
    
    Real O2 = Wrbc * aO2 * PO2;//O2 concentration(M)
    Real CO2 = Wrbc * aCO2 * PCO2;//CO2 concentration(M)
    
    Real n1 = -6.775 + 2.0372 * pHi - 0.1235 * pHi * pHi;
    Real n2 = -0.008765 + 0.00086 * PCO2 + 6.3 * 0.0000001 * PCO2 * PCO2;
    Real n3 = 0.2583 + 28.6978 * BPG - 917.69 * BPG * BPG;
    Real n4 = 1.6914 + 0.06186 * T + 0.00048 * T * T;
    
    Real K2d = K2/K2dd;
    Real K3d = K3/K3dd;
    
    Real nO2 = pow(O2,n);

    //    std::cout << "n: " <<  n << std::endl;	
    //    std::cout << "n1: " <<  n1 << std::endl;	
    //   std::cout << "n2: " <<  n2 << std::endl;	
    //    std::cout << "n3: " <<  n3 << std::endl;	
    //    std::cout << "n4: " <<  n4 << std::endl;	
    
    Real K4dn1 = K4dd * pow((57.5*0.000000001/H),n1);
    Real K4d = K4dn1 * pow((0.85*0.001/CO2),n2) * pow((DPG_S*0.001/BPG),n3) * pow((37/T),n4);
    //    Real K4d = K4dn1 * pow((0.85*0.001/CO2),n2) * pow((4.65*0.001/BPG),n3) * pow((37/T),n4);
    //    Real K4d = K4dn1 * pow((0.85*0.001/CO2),n2) * pow((4.65*0.001/BPG),n3) * pow((37/T),n4);
    Real KHbO2 = K4d * (K3d*CO2*(1+K3dd/H)+(1+H/K6dd))/(K2d*CO2*(1+K2dd/H)+(1+H/K5dd));
    
    Real kO2 = KHbO2 * nO2;

    setKHbO2_c( n3 ); 
    //    setKHbO2_c( KHbO2 ); // ducky 090616_
    
    Real SHbO2 = kO2 / (1 + kO2);

    setSHb_O2_c( SHbO2 ); // ducky 090616

    //    std::cout << "PO2: " <<  PO2 << std::endl;
    //    std::cout << "SHbO2: " <<  SHbO2 << std::endl;
    
    Real Ka;
    Real Keq;
    
    Keq = SHbO2 / (1 - SHbO2);      
    Ka = Keq * Kd;

    //    std::cout << "Keq: " <<  Keq << std::endl;	
    //    std::cout << "Ka: " <<  Ka << std::endl;	
    //    std::cout << "Kd: " <<  Kd << std::endl;	
    

    //   Real velocity =  deoxyHbcomp * Ka - oxyHbcomp * Kd;	
    //   velocity = velocity * getSuperSystem()->getSize() * N_A;

    Real oxyHb1 = E5.getVariable()->getMolarConc();//oxyHbMgATP
    Real oxyHb2 = E6.getVariable()->getMolarConc();//oxyHbATP
    Real oxyHb3 = E7.getVariable()->getMolarConc();//oxyHbADP    
    Real oxyHb4 = E8.getVariable()->getMolarConc();//oxyHb23DPG
    Real oxyHb5 = E9.getVariable()->getMolarConc();//oxyHb13DPG
    Real oxyHb6 = E10.getVariable()->getMolarConc();//band3oxyHbMgATP
    Real oxyHb7 = E11.getVariable()->getMolarConc();//band3oxyHbATP
    Real oxyHb8 = E12.getVariable()->getMolarConc();//band3oxyHbADP    
    Real oxyHb9 = E13.getVariable()->getMolarConc();//band3oxyHb23DPG
    Real oxyHb10 = E14.getVariable()->getMolarConc();//band3oxyHb13DPG
    Real oxyHb11 = E15.getVariable()->getMolarConc();//band3oxyHb
    Real oxyHb12 = E16.getVariable()->getMolarConc();//oxyHb

    Real toxyHb = oxyHb1 + oxyHb2 + oxyHb3 + oxyHb4 + oxyHb5 + oxyHb6 + oxyHb7 + oxyHb8 + oxyHb9 + oxyHb10 + oxyHb11 + oxyHb12;
    Real velocity =  (0.007-toxyHb) * Ka - toxyHb * Kd;	


    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux(velocity);
 
  }
  
  SET_METHOD( Real, SHb_O2_c )
    {
      theSHb_O2_c = value;
    }
  
  GET_METHOD( Real, SHb_O2_c )
    { 
      return theSHb_O2_c;
    }
  SET_METHOD( Real, KHbO2_c )
    {
      theKHbO2_c = value;
    }
  GET_METHOD( Real, KHbO2_c )
    { 
      return theKHbO2_c;
    }

 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;
  VariableReference E3;
  VariableReference E4;

  VariableReference E5;
  VariableReference E6;
  VariableReference E7;
  VariableReference E8;
  VariableReference E9;
  VariableReference E10;
  VariableReference E11;
  VariableReference E12;
  VariableReference E13;
  VariableReference E14;
  VariableReference E15;
  VariableReference E16;
                                                                                                
  Real n ;
  Real Wrbc ;
  Real Wpl ;
  Real K2 ;
  Real K2dd ;
  Real K3 ;
  Real K3dd ;
  Real K5dd ;
  Real K6dd ;
  Real K4dd ;
  Real Kd ;

  Real DPG_S ;
  //  Real Ka ;

 private:
  Real theSHb_O2_c;
  Real theKHbO2_c;

};

LIBECS_DM_INIT( DistributionHbFProcess, Process );

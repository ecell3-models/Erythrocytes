#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( G6PDHak_GSH_Process, ContinuousProcess )
{

 public:
  
  LIBECS_DM_OBJECT( G6PDHak_GSH_Process, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, K_G6P );
    PROPERTYSLOT_SET_GET( Real, K_GSSG );
    PROPERTYSLOT_SET_GET( Real, K_NADP );
    PROPERTYSLOT_SET_GET( Real, K_NADPH );
    PROPERTYSLOT_SET_GET( Real, K_ATP );
    PROPERTYSLOT_SET_GET( Real, K_DPG );
    PROPERTYSLOT_SET_GET( Real, Vm );
  }

  G6PDHak_GSH_Process()
    :
    K_G6P( 0.0 ),
    K_NADP( 0.0 ),
    K_NADPH( 0.0 ),
    K_ATP( 0.0 ),
    K_DPG( 0.0 ),
    Vm( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, K_G6P);
  SIMPLE_SET_GET_METHOD( Real, K_GSSG);
  SIMPLE_SET_GET_METHOD( Real, K_NADP );
  SIMPLE_SET_GET_METHOD( Real, K_NADPH );
  SIMPLE_SET_GET_METHOD( Real, K_ATP );
  SIMPLE_SET_GET_METHOD( Real, K_DPG );
  SIMPLE_SET_GET_METHOD( Real, Vm );
   
  virtual void initialize(){

    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );
    E3 = getVariableReference( "E3" );
    E4 = getVariableReference( "E4" );

    ConstAct = E0.getCoefficient();
    
  }

  virtual void fire(){
    


    Real GG = E3.getMolarConc()/E4.getMolarConc();
    Real velocity = GG/(K_GSSG + GG);
     Real ActCo = E0.getVariable()->getValue();

    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real NADP = 1000000 * S0.getVariable()->getMolarConc();
      Real G6P = 1000000 * S1.getVariable()->getMolarConc();
      Real NADPH = 1000000 * P1.getVariable()->getMolarConc();
      Real ATP = 1000000 * E1.getVariable()->getMolarConc();
      Real DPG = 1000000 * E2.getVariable()->getMolarConc();
        
      Real L = 1 + G6P / K_G6P;
      Real M = 1 + NADP * L / K_NADP + NADPH / K_NADPH + ATP 
	/ K_ATP + DPG / K_DPG;
      velocity *= Vm * ( NADP * G6P / ( K_NADP * K_G6P ) ) / M;
      
      velocity *= ActCo / 1000 / 1000000;
      
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
    }

    setFlux( velocity );
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference P1;
  VariableReference C0;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;
  VariableReference E3;
  VariableReference E4;

 Real ConstAct;

  Real K_G6P;
  Real K_NADP;
  Real K_NADPH;
  Real K_ATP;
  Real K_DPG;
  Real K_GSSG;
  Real Vm;
};

LIBECS_DM_INIT( G6PDHak_GSH_Process, Process );












#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( PRPPProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( PRPPProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Katp );
    PROPERTYSLOT_SET_GET( Real, Kr5p );
    PROPERTYSLOT_SET_GET( Real, Keq );
    PROPERTYSLOT_SET_GET( Real, Kv );
    PROPERTYSLOT_SET_GET( Real, Kprpp );
    PROPERTYSLOT_SET_GET( Real, Kamp );
    PROPERTYSLOT_SET_GET( Real, Vm );
    PROPERTYSLOT_SET_GET( Real, Vr );
    
  }
  
  PRPPProcess()
    :
    Katp( 0.0 ),
    Kr5p( 0.0 ),
    Keq( 0.0 ),
    Kv( 0.0 ),
    Kprpp( 0.0 ),
    Kamp( 0.0 ),
    Vm( 0.0 ),
    Vr( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, Katp );
  SIMPLE_SET_GET_METHOD( Real, Kr5p );
  SIMPLE_SET_GET_METHOD( Real, Keq );
  SIMPLE_SET_GET_METHOD( Real, Kv );
  SIMPLE_SET_GET_METHOD( Real, Kprpp );
  SIMPLE_SET_GET_METHOD( Real, Kamp );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  SIMPLE_SET_GET_METHOD( Real, Vr );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    ConstAct = E0.getCoefficient();

  }
  
  virtual void fire(){
    
    Vr = Vm / Kv;

    Real velocity = 1;
    
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real R5P =  1000 * S0.getVariable()->getMolarConc();
      Real tATP =  1000 * S1.getVariable()->getMolarConc();
      Real PRPP =  1000 * P0.getVariable()->getMolarConc();
      Real tAMP =  1000 * P1.getVariable()->getMolarConc();
      
      Real N = Vr * Kr5p * tATP + Vr * Katp * R5P + 
	Vm * Kamp * PRPP / Keq + Vm * Kprpp * tAMP / Keq + 
	Vr * R5P * tATP + Vm * PRPP;
      
      velocity = Vm * Vr * ( R5P * tATP - PRPP * tAMP / Keq ) / N;
      
      velocity *= N_A * ActCo / 1000 / 1000 / 3600 * 
	S0.getVariable()->getSuperSystem()->getSize();
      
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
  
  Real ConstAct;
  
  Real Katp;
  Real Kr5p;
  Real Keq;
  Real Kv;
  Real Kprpp;
  Real Kamp;
  Real Vm;
  Real Vr;
  
};

LIBECS_DM_INIT( PRPPProcess, Process );


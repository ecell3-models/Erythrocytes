#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( MichaelisUniUniReversiblemodifyProcess, ContinuousProcess )
{

 public:
  
  LIBECS_DM_OBJECT( MichaelisUniUniReversiblemodifyProcess, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, KmA );
    PROPERTYSLOT_SET_GET( Real, KmP );
    PROPERTYSLOT_SET_GET( Real, kcatf );
    PROPERTYSLOT_SET_GET( Real, kcatr );
  }

  MichaelisUniUniReversiblemodifyProcess()
    :
    KmA( 0.0 ),
    KmP( 0.0 ),
    kcatf( 0.0 ),
    kcatr( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KmA );
  SIMPLE_SET_GET_METHOD( Real, KmP );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  
  virtual void initialize(){
    
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    
    Real ConsAct = E0.getVariable()->getValue();

  }
  virtual void fire(){
    
    Real velocity = 1;
    
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
	
    }
    
    else{
      
      Real A = 1000000 * S0.getVariable()->getMolarConc();
      Real P = 1000000 * P0.getVariable()->getMolarConc();

      velocity = C0.getVariable()->getValue(); 

      velocity *= ( kcatf * A / KmA - kcatr * P / KmP ) / ( 1 + A / KmA + P / KmP );

      velocity *= ActCo / 1000;
      
    }

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference P0;
  VariableReference C0;
  VariableReference E0;
  
  Real ConstAct;
  
  Real KmA;
  Real KmP;
  Real kcatf;
  Real kcatr;

};

LIBECS_DM_INIT( MichaelisUniUniReversiblemodifyProcess, Process );












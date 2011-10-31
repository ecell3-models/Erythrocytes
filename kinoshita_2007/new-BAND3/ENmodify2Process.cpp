#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( ENmodify2Process, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( ENmodify2Process, Process ){

    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET( Real, KmPG );
    PROPERTYSLOT_SET_GET( Real, KiPG );
    PROPERTYSLOT_SET_GET( Real, KmPEP );
    PROPERTYSLOT_SET_GET( Real, KiPEP );
    PROPERTYSLOT_SET_GET( Real, KmMg );
    PROPERTYSLOT_SET_GET( Real, KiMg );
    PROPERTYSLOT_SET_GET( Real, kcatr );
    PROPERTYSLOT_SET_GET( Real, kcatf );
  }

  ENmodify2Process()
    :
    KmPG( 0.0 ),
    KiPG( 0.0 ),
    KmPEP( 0.0 ),
    KiPEP( 0.0 ),
    KmMg( 0.0 ),
    KiMg( 0.0 ),
    kcatr( 0.0 ),
    kcatf( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KmPG);
  SIMPLE_SET_GET_METHOD( Real, KiPG );
  SIMPLE_SET_GET_METHOD( Real, KmPEP );
  SIMPLE_SET_GET_METHOD( Real, KiPEP );
  SIMPLE_SET_GET_METHOD( Real, KmMg );
  SIMPLE_SET_GET_METHOD( Real, KiMg );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  
  virtual void initialize(){
    
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
  }
  
  virtual void fire(){
    
    Real velocity;
    
    Real ActCo = E0.getVariable()->getValue();
    
    Real PG = 1000000 * S0.getVariable()->getMolarConc();
    Real PEP =1000000 * P0.getVariable()->getMolarConc(); 
    Real Mg = 1000000 * E1.getVariable()->getMolarConc();

    Real AAm = PG / KmPG;
    Real AAi = PG / KiPG;
    Real PPm = Mg / KmMg;
    Real BBi = Mg / KiMg;
    Real QQi = PEP / KiPEP; 
   
    Real L = ( kcatf * AAm * BBi - kcatr * PPm * QQi );
    Real M = 1 + AAi + BBi + AAm * BBi + QQi + PPm * QQi;

    velocity= C0.getVariable()->getValue();
    velocity *= L / M;

    velocity *= ActCo /1000;

    setFlux( velocity );
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference C0;
  VariableReference E0;
  VariableReference E1;
  
  Real KmPG;
  Real KiPG;
  Real KmPEP;
  Real KiPEP;
  Real KmMg;
  Real KiMg;
  Real kcatr;
  Real kcatf;
};

LIBECS_DM_INIT( ENmodify2Process, Process );












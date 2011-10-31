#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( APKaknewProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( APKaknewProcess, Process ){

    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET( Real, KmA );
    PROPERTYSLOT_SET_GET( Real, KmB );
    PROPERTYSLOT_SET_GET( Real, KmP );
    PROPERTYSLOT_SET_GET( Real, KmQ );
    PROPERTYSLOT_SET_GET( Real, kcatf );
    PROPERTYSLOT_SET_GET( Real, kcatr );

  }

  APKaknewProcess()
    :
    KmA( 0.0 ),
    KmB( 0.0 ),
    KmP( 0.0 ),
    KmQ( 0.0 ),
    kcatf( 0.0 ),
    kcatr( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KmA );
  SIMPLE_SET_GET_METHOD( Real, KmB );
  SIMPLE_SET_GET_METHOD( Real, KmP );
  SIMPLE_SET_GET_METHOD( Real, KmQ );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  
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

    Real velocity = 1;
    
    velocity *= C0.getVariable()->getValue(); 
    Real ActCo = E0.getVariable()->getValue();

    Real a = 1000 * S0.getVariable()->getMolarConc();
    Real b = 1000 * S1.getVariable()->getMolarConc();
    Real p = 1000 * P0.getVariable()->getMolarConc();
    Real q = 1000 * P1.getVariable()->getMolarConc();

    Real sa = a / KmA;
    Real sb = b / KmB;
    Real sp = p / KmP;
    Real sq = q / KmQ;
    
    Real D = ( kcatf * sa * sb - kcatr * sp * sq );
    Real N = 1 + sa + sb + sa * sb + sp + sq + sp * sq;
    velocity *= D / N;
    velocity *= ActCo / 1000;

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
  
  Real KmA;
  Real KmB;
  Real KmP;
  Real KmQ;
  Real kcatf;
  Real kcatr;
};

LIBECS_DM_INIT( APKaknewProcess, Process );












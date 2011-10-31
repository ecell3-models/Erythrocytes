#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"
 
#include "System.hpp"
 
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( OrderedBiBiSimpleFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( OrderedBiBiSimpleFluxProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, KiA );
    PROPERTYSLOT_SET_GET( Real, KmA );
    PROPERTYSLOT_SET_GET( Real, KmB );
    PROPERTYSLOT_SET_GET( Real, Vm );
    
  }
  
  OrderedBiBiSimpleFluxProcess()
    :
    KiA( 0.0 ),
    KmA( 0.0 ),
    KmB( 0.0 ),
    Vm( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KiA );
  SIMPLE_SET_GET_METHOD( Real, KmA );
  SIMPLE_SET_GET_METHOD( Real, KmB );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  
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
    
    Real ActCo = E0.getVariable()->getValue();
    Real velocity = 1;
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }

    else{
      
      Real A=   1000000*S0.getVariable()->getMolarConc();
      Real B=   1000000*S1.getVariable()->getMolarConc();
      velocity *= Vm * A * B / ( KiA * KmB + KmA * B + KmB * A + A * B );
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      velocity *= ActCo / 1000/1000000 ;
      
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
  
   Real KiA;
   Real KmA;
   Real KmB;
   Real Vm;

};

LIBECS_DM_INIT( OrderedBiBiSimpleFluxProcess, Process );












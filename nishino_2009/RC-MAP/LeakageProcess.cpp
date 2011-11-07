#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( LeakageProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( LeakageProcess, Process ){
     
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Kx );
    PROPERTYSLOT_SET_GET( Real, z );
    PROPERTYSLOT_SET_GET( Real, r );
    PROPERTYSLOT_SET_GET( Real, Km );
    PROPERTYSLOT_SET_GET( Real, Vm );
    
  }
  
  LeakageProcess()
    :
    Kx( 0.0 ),
    z( 0.0 ),
    r( 0.0 ),
    Km( 0.0 ),
    Vm( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, Kx );
  SIMPLE_SET_GET_METHOD( Real, z );
  SIMPLE_SET_GET_METHOD( Real, r );
  SIMPLE_SET_GET_METHOD( Real, Km );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    
    ConstAct = E0.getCoefficient();
    
  }
  
  virtual void fire(){
    
    Real velocity = 1;
    
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real Se =  1000 * S0.getVariable()->getMolarConc();
      Real Pi =  1000 * P0.getVariable()->getMolarConc();
      
      velocity = Kx * z * log( r ) * ( Se - r * Pi ) / ( r - 1 ) 
	+ Vm * ( Se / ( Km + Se ) - r * Pi / ( Km + r * Pi ) );
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      velocity *= ActCo / 1000 / 1000 / 3600;
    }

    setFlux( velocity );    
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference P1;
  VariableReference C0;
  VariableReference E0;
  
  Real ConstAct;
  
  Real Kx;
  Real z;
  Real r;
  Real Km;
  Real Vm;
  
};

LIBECS_DM_INIT( LeakageProcess, Process );

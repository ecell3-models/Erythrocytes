#include "libecs.hpp"
#include "Process.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;
 
LIBECS_DM_CLASS( IonTransakProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( IonTransakProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, k0 );
    PROPERTYSLOT_SET_GET( Real, k1 );
    
  }
  
  IonTransakProcess()
    :
    k0( 0.0 ),
    k1( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, k0 );
  SIMPLE_SET_GET_METHOD( Real, k1 );
  
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

      Real IN = S0.getVariable()->getMolarConc();
      Real EX = P0.getVariable()->getMolarConc();
      
      velocity = k0 * IN - k1 * EX;
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
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
  
  Real k0;
  Real k1;

};

LIBECS_DM_INIT( IonTransakProcess, Process );

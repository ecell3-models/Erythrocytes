#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( NUCtrSUBProcess, ContinuousProcess )
{

 public:
  
  LIBECS_DM_OBJECT( NUCtrSUBProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Km );
    PROPERTYSLOT_SET_GET( Real, Vm );
    PROPERTYSLOT_SET_GET( Real, SW );
    
  }
  
  NUCtrSUBProcess()
    :
    Km( 0.0 ),
    Vm( 0.0 ),
    SW( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, Km );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  SIMPLE_SET_GET_METHOD( Real, SW );
  
  virtual void initialize(){
    
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    
  }
  
  virtual void fire(){
    
    Real velocity = 1;
    
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
	
    }
    
    else{
      
      Real IN = 1000 * S0.getVariable()->getMolarConc();
      Real EX = 1000 * P0.getVariable()->getMolarConc();
      
      velocity = Vm * ( ( IN / ( Km + IN ) )- ( EX / ( Km + EX ) ) );
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      velocity *= ActCo / 1000 / 1000 / 3600;
      velocity *= SW;
    }

    setFlux( velocity );
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference C0;
  VariableReference E0;
  
  Real ConstAct;
  
  Real Km;
  Real Vm;
  Real SW;
};

LIBECS_DM_INIT( NUCtrSUBProcess, Process );












#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( HXTR2Process, ContinuousProcess )
{
  
 public:

  LIBECS_DM_OBJECT( HXTR2Process, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Km );
    PROPERTYSLOT_SET_GET( Real, Pm );
    PROPERTYSLOT_SET_GET( Real, Vm );
    PROPERTYSLOT_SET_GET( Real, Vmin );
    PROPERTYSLOT_SET_GET( Real, Kmin );
    PROPERTYSLOT_SET_GET( Real, Ki );


  }
  
  HXTR2Process()
    :
    Km( 0.0 ),
    Pm( 0.0 ),
    Vm( 0.0 ),
    Vmin( 0.0 ),
    Kmin( 0.0 ),
    Ki( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, Km );
  SIMPLE_SET_GET_METHOD( Real, Pm );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  SIMPLE_SET_GET_METHOD( Real, Vmin );
  SIMPLE_SET_GET_METHOD( Real, Kmin );
  SIMPLE_SET_GET_METHOD( Real, Ki );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
    ConstAct = E0.getCoefficient();
  }

  virtual void fire(){
    
    Real velocity =1;
    
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){ 
      
      velocity = ConstAct;
      
    }
    
    else{

      Real Sa = 1000 * S0.getMolarConc();      

      Real HXe = 1000 * P0.getMolarConc();      
      Real ADEe = 1000 * E1.getMolarConc();      
      
      //      Kmin,Ki -> mM Vm-> mM/h

      Real efflux = Pm * Sa + Vm * ( Sa / ( Sa + Km ) );
      Real influx = Vmin * HXe / (Kmin*(1 + ADEe/Ki) + HXe);
      velocity = efflux - influx;
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      
      velocity *= ActCo / 1000 / 1000 / 3600;
    }

    setFlux( velocity );
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference C0;
  VariableReference E0;
  VariableReference E1;
  
  Real ConstAct;

  Real Km;
  Real Pm;
  Real Vm;
  Real Vmin;
  Real Kmin;
  Real Ki;
};

LIBECS_DM_INIT( HXTR2Process, Process );












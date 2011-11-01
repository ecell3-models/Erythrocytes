#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( GSSGtransportProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( GSSGtransportProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Km1 );
    PROPERTYSLOT_SET_GET( Real, Km2 );
    PROPERTYSLOT_SET_GET( Real, Kmatp );
    PROPERTYSLOT_SET_GET( Real, Vmax1 );
    PROPERTYSLOT_SET_GET( Real, Vmax2 );
    
  }

  GSSGtransportProcess()
    :
    Km1( 0.0 ),
    Km2( 0.0 ),
    Kmatp( 0.0 ),
    Vmax1( 0.0 ),
    Vmax2( 0.0 )
    {
      ; // do nothing
    }

  SIMPLE_SET_GET_METHOD( Real, Km1 );
  SIMPLE_SET_GET_METHOD( Real, Km2 );
  SIMPLE_SET_GET_METHOD( Real, Kmatp );
  SIMPLE_SET_GET_METHOD( Real, Vmax1 );
  SIMPLE_SET_GET_METHOD( Real, Vmax2 );

  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
    ConstAct = E0.getCoefficient();
    
  }

  virtual void fire(){

    Real velocity = 1;
  
    Real ActCo = E0.getVariable()->getValue();
  
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real GSSG =  1000 * S0.getVariable()->getMolarConc();
      Real MgATP =  1000 * E1.getVariable()->getMolarConc();
      
      if( GSSG > 2 ){

        velocity = Vmax1 * ( GSSG / ( GSSG + Km1 ) ) 
	  * ( MgATP / ( MgATP + Kmatp ) );
	
      }
      
      if ( GSSG <= 2 ){
	
        velocity = Vmax2 * ( GSSG / ( GSSG + Km2 ) ) 
	  * ( MgATP / ( MgATP + Kmatp ) );
	
      }

      
      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      
    }
    
    velocity *= ActCo / 1000 / 1000000 /3600;   
    
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
  
  Real ConstAct;
  
  Real Km1;
  Real Km2;
  Real Kmatp;
  Real Vmax1;
  Real Vmax2;
  
};

LIBECS_DM_INIT( GSSGtransportProcess, Process );

#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( PumpMgSUBProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( PumpMgSUBProcess, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, Km );
    PROPERTYSLOT_SET_GET( Real, Vm );
    PROPERTYSLOT_SET_GET( Real, B1 );
    PROPERTYSLOT_SET_GET( Real, B2 );
    PROPERTYSLOT_SET_GET( Real, B3 );
    PROPERTYSLOT_SET_GET( Real, k2k1 );
    PROPERTYSLOT_SET_GET( Real, k3k1 );
    PROPERTYSLOT_SET_GET( Real, z ); 
    PROPERTYSLOT_SET_GET( Real, SW ); 

  }
  
  PumpMgSUBProcess()
    :
    Km( 0.0 ),
    Vm( 0.0 ),
    B1( 0.0 ),
    B2( 0.0 ),
    B3( 0.0 ),
    k2k1( 0.0 ),
    k3k1( 0.0 ),
    z( 0.0 ),
    SW( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, Km );
  SIMPLE_SET_GET_METHOD( Real, Vm );
  SIMPLE_SET_GET_METHOD( Real, B1 );
  SIMPLE_SET_GET_METHOD( Real, B2 );
  SIMPLE_SET_GET_METHOD( Real, B3 );
  SIMPLE_SET_GET_METHOD( Real, k2k1 );
  SIMPLE_SET_GET_METHOD( Real, k3k1 );
  SIMPLE_SET_GET_METHOD( Real, z );
  SIMPLE_SET_GET_METHOD( Real, SW );
  
  virtual void initialize(){

    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    S2 = getVariableReference( "S2" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    P2 = getVariableReference( "P2" );
    P3 = getVariableReference( "P3" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

  }

  virtual void fire(){
    
    Real velocity = 1;

    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real SKe  =  1000 * S1.getVariable()->getMolarConc();
      Real SNai =   1000 * S2.getVariable()->getMolarConc();
      Real Satpt =  1000 * E1.getVariable()->getMolarConc();
      
      Real BSNai = B3 / SNai + 1;
	
      velocity = ( Satpt / ( Satpt + Km ) ) * ( Vm / 2 ) 
	* ( SKe * SKe + B2 * SKe * z / 2 ) / ( B1 * B2 + 2 * B2 * SKe 
        + SKe * SKe + BSNai * BSNai * BSNai * ( B1 * B2 * k2k1 + k3k1 
        * ( SKe * SKe + B2 * SKe * z ) ) );

      velocity *= N_A * S0.getVariable()->getSuperSystem()->getSize();
      velocity *= ActCo / 1000 / 3600 / 1000;
      velocity *= SW;
      
    }

    setFlux( velocity );
    
  }
  
 protected:
  
  VariableReference S0;
  VariableReference S1;
  VariableReference S2;
  VariableReference P0;
  VariableReference P1;
  VariableReference P2;
  VariableReference P3;
  VariableReference C0;
  VariableReference E0;
  VariableReference E1;

  Real ConstAct;

  Real Km;
  Real Vm;
  Real B1;
  Real B2;
  Real B3;
  Real k2k1;
  Real k3k1;
  Real z;
  Real SW;

};

LIBECS_DM_INIT( PumpMgSUBProcess, Process );












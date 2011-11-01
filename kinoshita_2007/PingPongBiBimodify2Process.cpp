#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( PingPongBiBimodify2Process, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( PingPongBiBimodify2Process, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, k1 );
    PROPERTYSLOT_SET_GET( Real, k2 );
    PROPERTYSLOT_SET_GET( Real, k3 );
    PROPERTYSLOT_SET_GET( Real, k4 );
    PROPERTYSLOT_SET_GET( Real, k5 );
    PROPERTYSLOT_SET_GET( Real, k6 );
    PROPERTYSLOT_SET_GET( Real, k7 );
    PROPERTYSLOT_SET_GET( Real, k8 );

  }
  
  PingPongBiBimodify2Process()
    :
    k1( 0.0 ),
    k2( 0.0 ),
    k3( 0.0 ),
    k4( 0.0 ),
    k5( 0.0 ),
    k6( 0.0 ),
    k7( 0.0 ),
    k8( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, k1 );
  SIMPLE_SET_GET_METHOD( Real, k2 );
  SIMPLE_SET_GET_METHOD( Real, k3 );
  SIMPLE_SET_GET_METHOD( Real, k4 );
  SIMPLE_SET_GET_METHOD( Real, k5 );
  SIMPLE_SET_GET_METHOD( Real, k6 );
  SIMPLE_SET_GET_METHOD( Real, k7 );
  SIMPLE_SET_GET_METHOD( Real, k8 );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    
    ConstAct = E0.getCoefficient();
    
    D1 = k1 * k3 * ( k6 + k7 );
    D2 = k5 * k7 * ( k2 + k3 );
    D3 = k2 * k4 * ( k6 + k7 );
    D4 = k6 * k8 * ( k2 + k3 );
    D5 = k1 * k5 * ( k3 + k7 );
    D6 = k4 * k8 * ( k2 + k6 );
    D7 = k5 * k8 * ( k2 + k3 );
    D8 = k1 * k4 * ( k6 + k7 );
    N1 = k1 * k3 * k5 * k7;
    N2 = k2 * k4 * k6 * k8;
    
  }
  
  virtual void fire(){
    
    Real velocity = 1;
    Real ActCo = E0.getVariable()->getValue();
    
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      Real A =   S0.getVariable()->getMolarConc();
      Real B =   S1.getVariable()->getMolarConc();
      Real P =   P0.getVariable()->getMolarConc();
      Real Q =   P1.getVariable()->getMolarConc();

      Real M =   N1 * A * B - N2 * P * Q;
 
      Real N =   D1 * A + D2 * B + D3 * P + D4 * Q + D5 * A * B 
	+ D6 * P * Q + D7 * B * Q + D8 * A * P;
      
      velocity = M / N;

      velocity *= C0.getVariable()->getValue();
      velocity *= ActCo / 1000;

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

  Real D1;
  Real D2;
  Real D3;
  Real D4;
  Real D5;
  Real D6;
  Real D7;
  Real D8;
  Real N1;
  Real N2;

  Real k1;
  Real k2;
  Real k3;
  Real k4;
  Real k5;
  Real k6;
  Real k7;
  Real k8;

};

LIBECS_DM_INIT( PingPongBiBimodify2Process, Process );












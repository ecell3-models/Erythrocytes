#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( GSSGRProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( GSSGRProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, k1 );
    PROPERTYSLOT_SET_GET( Real, k2 );
    PROPERTYSLOT_SET_GET( Real, k3 );
    PROPERTYSLOT_SET_GET( Real, k4 );
    PROPERTYSLOT_SET_GET( Real, k5 );
    PROPERTYSLOT_SET_GET( Real, k6 );
    PROPERTYSLOT_SET_GET( Real, k7 );
    PROPERTYSLOT_SET_GET( Real, k8 );
    PROPERTYSLOT_SET_GET( Real, k9 );
    PROPERTYSLOT_SET_GET( Real, k10 );
    PROPERTYSLOT_SET_GET( Real, k11 );
    PROPERTYSLOT_SET_GET( Real, k12 );
    
  }

  GSSGRProcess()
    :
    k1( 0.0 ),
    k2( 0.0 ),
    k3( 0.0 ),
    k4( 0.0 ),
    k5( 0.0 ),
    k6( 0.0 ),
    k7( 0.0 ),
    k8( 0.0 ),
    k9( 0.0 ),
    k10( 0.0 ),
    k11( 0.0 ),
    k12( 0.0 )
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
  SIMPLE_SET_GET_METHOD( Real, k9 );
  SIMPLE_SET_GET_METHOD( Real, k10 );
  SIMPLE_SET_GET_METHOD( Real, k11 );
  SIMPLE_SET_GET_METHOD( Real, k12 );

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

    Real D1;
    Real D2;
    Real D3;
    Real D4;
    Real D5;
    Real D6;
    Real D7;
    Real D8;
    Real D9;
    Real D10;
    Real D11;
    Real D12;
    Real D13;
    Real D14;
    Real D15;
    Real D16;
    Real D17;
    Real D18;
    Real N1;
    Real N2;
    
    D1 = k2 * k9 * k11 * ( k4 * k6 + k4 * k7 + k5 * k7 );
    D2 = k1 * k9 * k11 * ( k4 * k6 + k4 * k7 + k5 * k7 );  
    D3 = k3 * k5 * k7 * k9 * k11;
    D4 = k2 * k4 * k6 * k8 * k11;
    D5 = k2 * k9 * k12 * ( k4 * k6 + k4 * k7 + k5 * k7 );
    D6 = k1 * k3 * ( k5 * k9 * k11 + k6 * k9 * k11 + k7 * k9 * k11 
      + k5 * k7 * k9 + k5 * k7 * k11 );
    D7 = k1 * k4 * k6 * k8 * k11;
    D8 = k3 * k5 * k7 * k9 * k12;
    D9 = k2 * k4 * k6 * k8 * k10;
    D10 = k2 * k4 * k6 * k8 * k12;
    D11 = k2 * k10 * k12 * ( k4 * k6 + k4 * k7 + k5 * k7 );
    D12 =k1 * k3 * k8 * k11 * ( k5 + k6 );
    D13 = k1 * k3 * k5 * k7 * k10;
    D14 = k1 * k4 * k6 * k8 * k10;
    D15 = k3 * k5 * k7 * k10 * k12;
    D16 = k8 * k10 * k12 * ( k2 * k4 + k2 * k5 + k2 * k6 + k4 * k6 );
    D17 =k1 * k3 * k8 * k10 * ( k5 + k6 );
    D18 =k3 * k8 * k10 * k12 * ( k5 + k6 );
    N1 = k1 * k3 * k5 * k7 * k9 * k11;
    N2 = k2 * k4 * k6 * k8 * k10 * k12;

    Real velocity = 1;
  
    Real ActCo = E0.getVariable()->getValue();
  
    if( ActCo == 0 ){
      
      velocity = ConstAct;
      
    }
    
    else{
      
      velocity = C0.getVariable()->getValue();
      Real A =  S0.getVariable()->getMolarConc();
      Real B =  S1.getVariable()->getMolarConc();
      Real P =  P0.getVariable()->getMolarConc();
      Real Q =  P1.getVariable()->getMolarConc();
      
      Real D = D1 + D2 * A + D3 * B + D4 * P + D5 * Q + D6 * A * B + 
	D7 * A * P + D8 * B * Q + D9 * P * P + ( D10 + D11 ) * P * Q + 
	( D12 + D13 ) * A * B * P + D14 * A * P * P + D15 * B * P * Q + 
	D16 * P * P * Q + D17 * A * B * P * P + D18 * B * P * P * Q;
  
      velocity *= ( N1 * A * B - N2 * P * P * Q ) / D;
      
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
  
  Real k1;
  Real k2;
  Real k3;
  Real k4;
  Real k5;
  Real k6;
  Real k7;
  Real k8;
  Real k9;
  Real k10;
  Real k11;
  Real k12;

  
};

LIBECS_DM_INIT( GSSGRProcess, Process );

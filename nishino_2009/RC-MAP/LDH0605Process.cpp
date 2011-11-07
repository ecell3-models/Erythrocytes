#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( LDH0605Process, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( LDH0605Process, Process ){

    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, KmNADH );
    PROPERTYSLOT_SET_GET( Real, KiNADH );
    PROPERTYSLOT_SET_GET( Real, KmNAD );
    PROPERTYSLOT_SET_GET( Real, KiNAD );
    PROPERTYSLOT_SET_GET( Real, KmLAC );
    PROPERTYSLOT_SET_GET( Real, KiLAC );
    PROPERTYSLOT_SET_GET( Real, KiaPYR );
    PROPERTYSLOT_SET_GET( Real, KibPYR );
    PROPERTYSLOT_SET_GET( Real, KmPYR );
    PROPERTYSLOT_SET_GET( Real, Kcatf );
    PROPERTYSLOT_SET_GET( Real, Kcatr );
  }
  
  LDH0605Process()
    :
    KmNADH( 0.0 ),
    KiNADH( 0.0 ),
    KmNAD( 0.0 ),
    KiNAD( 0.0 ),
    KmLAC( 0.0 ),
    KmPYR( 0.0 ),
    KiLAC( 0.0 ),
    KiaPYR( 0.0 ),
    KibPYR( 0.0 ),
    Kcatf( 0.0 ),
    Kcatr( 0.0 )
    {
      ; // do nothing
    }
  
    SIMPLE_SET_GET_METHOD( Real, KmNADH );
    SIMPLE_SET_GET_METHOD( Real, KiNADH );
    SIMPLE_SET_GET_METHOD( Real, KmNAD );
    SIMPLE_SET_GET_METHOD( Real, KiNAD );
    SIMPLE_SET_GET_METHOD( Real, KmLAC );
    SIMPLE_SET_GET_METHOD( Real, KmPYR );
    SIMPLE_SET_GET_METHOD( Real, KiLAC );
    SIMPLE_SET_GET_METHOD( Real, KiaPYR );
    SIMPLE_SET_GET_METHOD( Real, KibPYR );
    SIMPLE_SET_GET_METHOD( Real, Kcatf );
    SIMPLE_SET_GET_METHOD( Real, Kcatr );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    
  }
  virtual void fire(){
    
    Real velocity = 1;
    
    Real ActCo = E0.getVariable()->getValue();    
    
    Real PYR = 1000000 * S0.getVariable()->getMolarConc();
    Real NADH = 1000000 * S1.getVariable()->getMolarConc();
    Real LAC = 1000000 * P0.getVariable()->getMolarConc();
    Real NAD = 1000000 * P1.getVariable()->getMolarConc();
    Real pH = E1.getVariable()->getValue();    
    

  Real NADHi = NADH/KiNADH;
  Real NADi = NAD/KiNAD;
  Real PYRai = PYR/KiaPYR;
  Real PYRbi = PYR/KibPYR;
  Real PYRm = PYR/KmPYR;
  Real LACm = LAC/KmLAC;
  Real LACi = LAC/KiLAC;

  Real NADHmi = KmNADH/KiNADH;
  Real NADmi = KmNAD/KiNAD; 



  
  Real L = (Kcatf * NADHi * PYRm ) - (Kcatr * NADi * LACm);
  
  Real MM = 1 + PYRm*NADHmi + LACm*NADmi;
  
  Real M = MM *(1+ PYRbi) + NADHi + NADi + NADHi*PYRm + 
    NADHi*LACm*NADmi + NADi*LACm*NADHmi + LACm*NADi + NADHi*PYRm*LACi + 
    PYRai*LACm*NADi;

  velocity *= L/M; 
    
    velocity *= C0.getVariable()->getValue(); 
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
  VariableReference E1;
  
  Real KmNADH;
  Real KiNADH;
  Real KmNAD;
  Real KiNAD;
  Real KmLAC;
  Real KmPYR;
  Real KiLAC;
  Real KiaPYR;
  Real KibPYR;
  Real Kcatf;
  Real Kcatr;
};

LIBECS_DM_INIT( LDH0605Process, Process );






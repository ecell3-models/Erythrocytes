#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"
USE_LIBECS;

LIBECS_DM_CLASS( ALDmodify2Process, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( ALDmodify2Process, Process ){

    INHERIT_PROPERTIES( Process );
      
    PROPERTYSLOT_SET_GET( Real, KmA );
    PROPERTYSLOT_SET_GET( Real, KiA );
    PROPERTYSLOT_SET_GET( Real, KmP );
    PROPERTYSLOT_SET_GET( Real, KmQ );
    PROPERTYSLOT_SET_GET( Real, KiQ );
    PROPERTYSLOT_SET_GET( Real, KiI );
    PROPERTYSLOT_SET_GET( Real, kcatf );
    PROPERTYSLOT_SET_GET( Real, kcatr );
    
  }
  
  ALDmodify2Process()
    :
    KmA( 0.0 ),
    KiA( 0.0 ),
    KmP( 0.0 ),
    KmQ( 0.0 ),
    KiQ( 0.0 ),
    KiI( 0.0 ),
    kcatf( 0.0 ),
    kcatr( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KmA );
  SIMPLE_SET_GET_METHOD( Real, KiA );
  SIMPLE_SET_GET_METHOD( Real, KmP );
  SIMPLE_SET_GET_METHOD( Real, KmQ );
  SIMPLE_SET_GET_METHOD( Real, KiQ );
  SIMPLE_SET_GET_METHOD( Real, KiI );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  
  virtual void initialize(){
    
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    C0 = getVariableReference( "C0" );
    E1 = getVariableReference( "E1" );
    E0 = getVariableReference( "E0" );
    
    }
  
  virtual void fire(){
    
    Real FDP =  1000000 * S0.getVariable()->getMolarConc();
    Real GA3P =  1000000 * P0.getVariable()->getMolarConc();
    Real DHAP =  1000000 * P1.getVariable()->getMolarConc();
    Real BPG =  1000000 * E1.getVariable()->getMolarConc();
    
    Real am = FDP / KmA;
    Real ai = FDP / KiA;
    Real pm = GA3P / KmP;
    Real qi = DHAP / KiQ;
    Real ji = BPG / KiI;
    
    Real D = ( kcatf * am - kcatr * pm * qi );
    Real N = 1 + ji + am + KmQ * pm / KiQ + ( 1 + ji ) + qi 
      + KmQ * ai * pm / KiQ + pm * qi;
    
    Real velocity = C0.getVariable()->getValue() * ( D / N );

    velocity *= E0.getVariable()->getValue() / 1000;
    setFlux( velocity );

  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference P1;
  VariableReference C0;
  VariableReference E0;
  VariableReference E1;
  
  Real KmA;
  Real KiA;
  Real KmP;
  Real KmQ;
  Real KiQ;
  Real KiI;
  Real kcatf;
  Real kcatr;
};

LIBECS_DM_INIT( ALDmodify2Process, Process );












#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiBiPGKFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiBiPGKFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KmMgADP );
      PROPERTYSLOT_SET_GET( Real, KiMgADP );
      PROPERTYSLOT_SET_GET( Real, KmB13PG );
      PROPERTYSLOT_SET_GET( Real, KiB13PG );
      PROPERTYSLOT_SET_GET( Real, KmMgATP );
      PROPERTYSLOT_SET_GET( Real, KiMgATP );
      PROPERTYSLOT_SET_GET( Real, KmP3GA );
      PROPERTYSLOT_SET_GET( Real, KiP3GA );
      PROPERTYSLOT_SET_GET( Real, PGK );
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );
    }

  SIMPLE_SET_GET_METHOD( Real, KmMgADP );
  SIMPLE_SET_GET_METHOD( Real, KiMgADP );
  SIMPLE_SET_GET_METHOD( Real, KmB13PG );
  SIMPLE_SET_GET_METHOD( Real, KiB13PG );
  SIMPLE_SET_GET_METHOD( Real, KmMgATP );
  SIMPLE_SET_GET_METHOD( Real, KiMgATP );
  SIMPLE_SET_GET_METHOD( Real, KmP3GA );
  SIMPLE_SET_GET_METHOD( Real, KiP3GA );
  SIMPLE_SET_GET_METHOD( Real, PGK );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    E0 = getVariableReference( "E0" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
  }  
  
  virtual void fire()
  {
    Real pgkrd = 1 + S1.getMolarConc() / KiMgADP +
      S0.getMolarConc() / KiB13PG +
      ( S1.getMolarConc() * S0.getMolarConc() ) / ( KiMgADP * KmB13PG ) +
      P1.getMolarConc() / KiMgATP +
      P0.getMolarConc() / KiP3GA +
      ( P1.getMolarConc() * P0.getMolarConc() ) / ( KiMgATP * KmP3GA );
    
    Real velocity  = ( PGK / pgkrd ) * 
      ( ( ( kcatf * S0.getMolarConc() * S1.getMolarConc() ) / ( KiMgADP * KmB13PG ) ) -
	( ( kcatr * P0.getMolarConc() * P1.getMolarConc() ) / ( KiMgATP * KmP3GA ) ) );

    velocity = velocity * getSuperSystem()->getSize() * N_A * E0.getValue()/1000.0; // ducky 090716
    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference S1;
  VariableReference E0;
  VariableReference P0;
  VariableReference P1;

  Real KmMgADP;
  Real KiMgADP;
  Real KmB13PG;
  Real KiB13PG;
  Real KmMgATP;
  Real KiMgATP;
  Real KmP3GA;
  Real KiP3GA;
  Real PGK;
  Real kcatf;
  Real kcatr;

};

LIBECS_DM_INIT( BiBiPGKFluxProcess, Process );

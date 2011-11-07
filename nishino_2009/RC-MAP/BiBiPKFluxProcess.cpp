#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiBiPKFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiBiPKFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KTATP );
      PROPERTYSLOT_SET_GET( Real, KRPyr );
      PROPERTYSLOT_SET_GET( Real, KRPEP );
      PROPERTYSLOT_SET_GET( Real, KRMgATP );
      PROPERTYSLOT_SET_GET( Real, KRMgADP );
      PROPERTYSLOT_SET_GET( Real, KRF16P2 );
      PROPERTYSLOT_SET_GET( Real, KRG16P2 );
      PROPERTYSLOT_SET_GET( Real, PK );
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );
    }

  SIMPLE_SET_GET_METHOD( Real, KTATP );
  SIMPLE_SET_GET_METHOD( Real, KRPyr );
  SIMPLE_SET_GET_METHOD( Real, KRPEP );
  SIMPLE_SET_GET_METHOD( Real, KRMgATP );
  SIMPLE_SET_GET_METHOD( Real, KRMgADP );
  SIMPLE_SET_GET_METHOD( Real, KRF16P2 );
  SIMPLE_SET_GET_METHOD( Real, KRG16P2 );
  SIMPLE_SET_GET_METHOD( Real, PK );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );
    E3 = getVariableReference( "E3" );
    E4 = getVariableReference( "E4" );

  }  
  
  virtual void fire()
  {
    Real L = ( ( pow( 10, -6.8 ) / pow( 10, -1 * E0.getValue() ) ) *
      pow( 1 + ( E1.getMolarConc() / KTATP ), 4 ) ) /
      ( ( pow( 1 + ( S0.getMolarConc() / KRPEP ) + ( P0.getMolarConc() / KRPyr ), 4 ) ) *
	( pow( 1 + ( E2.getMolarConc() / KRF16P2 ) + ( E3.getMolarConc() / KRG16P2 ), 4 ) ) );

    Real pkrd = 1 + ( S0.getMolarConc() / KRPEP ) +
      ( S1.getMolarConc() / KRMgADP ) +
      ( ( S0.getMolarConc() * S1.getMolarConc() ) / ( KRPEP * KRMgADP ) ) +
      ( P0.getMolarConc() / KRPyr ) +
      ( P1.getMolarConc() / KRMgATP ) +
      ( ( P0.getMolarConc() * P1.getMolarConc() ) / ( KRPyr * KRMgATP ) );

    Real velocity = ( PK / ( ( 1 + L ) * pkrd ) ) *
      ( ( kcatf * S0.getMolarConc() * S1.getMolarConc() ) / ( KRPEP * KRMgADP ) -
	( kcatr * P0.getMolarConc() * P1.getMolarConc() ) / ( KRMgATP * KRPyr ) );

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E4.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference P1;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;
  VariableReference E3;
  VariableReference E4;

  Real KTATP;
  Real KRPyr;
  Real KRPEP;
  Real KRMgATP;
  Real KRMgADP;
  Real KRF16P2;
  Real KRG16P2;
  Real PK;
  Real kcatf;
  Real kcatr;

};

LIBECS_DM_INIT( BiBiPKFluxProcess, Process );

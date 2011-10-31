#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiBiPFKak_GSH_FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiBiPFKak_GSH_FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, K_GSSG );
      PROPERTYSLOT_SET_GET( Real, KmFru6P );
      PROPERTYSLOT_SET_GET( Real, KmMgATP );
      PROPERTYSLOT_SET_GET( Real, KmFru16P2 );
      PROPERTYSLOT_SET_GET( Real, KmMgADP );
      PROPERTYSLOT_SET_GET( Real, KTATP );
      PROPERTYSLOT_SET_GET( Real, KTMg );
      PROPERTYSLOT_SET_GET( Real, KTB23PG );
      PROPERTYSLOT_SET_GET( Real, KRAMP );
      PROPERTYSLOT_SET_GET( Real, KRPhos );
      PROPERTYSLOT_SET_GET( Real, KRGlc16P2 );
      
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );
      PROPERTYSLOT_SET_GET( Real, Ka );
      PROPERTYSLOT_SET_GET( Real, n );

    }

  SIMPLE_SET_GET_METHOD( Real, K_GSSG );
  SIMPLE_SET_GET_METHOD( Real, KmFru6P );
  SIMPLE_SET_GET_METHOD( Real, KmMgATP );
  SIMPLE_SET_GET_METHOD( Real, KmFru16P2 );
  SIMPLE_SET_GET_METHOD( Real, KmMgADP );
  SIMPLE_SET_GET_METHOD( Real, KTATP );
  SIMPLE_SET_GET_METHOD( Real, KTMg );
  SIMPLE_SET_GET_METHOD( Real, KTB23PG );
  SIMPLE_SET_GET_METHOD( Real, KRAMP );
  SIMPLE_SET_GET_METHOD( Real, KRPhos );
  SIMPLE_SET_GET_METHOD( Real, KRGlc16P2 );
  
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  SIMPLE_SET_GET_METHOD( Real, Ka );
  SIMPLE_SET_GET_METHOD( Real, n );


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
    E5 = getVariableReference( "E5" );
    E6 = getVariableReference( "E6" );
    E7 = getVariableReference( "E7" ); 
    E8 = getVariableReference( "E8" ); 
    E9 = getVariableReference( "E9" ); 
    C0 = getVariableReference( "C0" ); 

  }  
  
  virtual void fire()
  {
    Real L = ( pow( pow( 10, -1 * E0.getValue() ) / Ka, n ) *
	       pow( 1 + E1.getMolarConc() / KTATP, 4 ) *
	       pow( 1 + E2.getMolarConc() / KTMg, 4 ) *
	       pow( 1 + E3.getMolarConc() / KTB23PG, 4 ) ) /
      ( pow( 1 + ( S0.getMolarConc() / KmFru6P ) + ( P0.getMolarConc() / KmFru16P2 ), 4 ) *
	pow( 1 + E4.getMolarConc() / KRAMP, 4 ) *
	pow( 1 + E5.getMolarConc() / KRPhos, 4 ) *
	pow( 1 + E6.getMolarConc() / KRGlc16P2, 4 ) );

    Real pfkrd = 1 + ( S0.getMolarConc() / KmFru6P ) +
      ( S1.getMolarConc() / KmMgATP ) +
      ( ( S0.getMolarConc() * S1.getMolarConc() ) / ( KmFru6P * KmMgATP ) ) +
      ( P0.getMolarConc() / KmFru16P2 ) +
      ( P1.getMolarConc() / KmMgADP ) +
      ( ( P0.getMolarConc() * P1.getMolarConc() ) / ( KmFru16P2 * KmMgADP ) );

    Real velocity = ( C0.getMolarConc() / ( ( 1 + L ) * pfkrd ) ) * 
      ( ( kcatf * S0.getMolarConc() * S1.getMolarConc() ) / ( KmFru6P * KmMgATP ) -
	//note: use book model.
	( kcatf * P0.getMolarConc() * P1.getMolarConc() ) / ( KmFru16P2 * KmMgADP ) );

    velocity = velocity * getSuperSystem()->getSize() * N_A * E7.getValue()/1000;

    Real GG = E8.getMolarConc()/E9.getMolarConc();
    velocity *= GG/(K_GSSG + GG);
    setFlux( velocity );

  }

 protected:

  Real K_GSSG;
  Real KmFru6P;
  Real KmMgATP;
  Real KmFru16P2;
  Real KmMgADP;
  Real KTATP;
  Real KTMg;
  Real KTB23PG;
  Real KRAMP;
  Real KRPhos;
  Real KRGlc16P2;

  Real kcatf;
  Real kcatr;
  Real Ka;
  Real n;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference P1;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;
  VariableReference E3;
  VariableReference E4;
  VariableReference E5;
  VariableReference E6;
  VariableReference E7;
  VariableReference E8;
  VariableReference E9;
  VariableReference C0;

};

LIBECS_DM_INIT( BiBiPFKak_GSH_FluxProcess, Process );

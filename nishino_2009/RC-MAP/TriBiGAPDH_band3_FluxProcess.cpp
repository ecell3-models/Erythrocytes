#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( TriBiGAPDH_band3_FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( TriBiGAPDH_band3_FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KmNAD );
      PROPERTYSLOT_SET_GET( Real, KiNAD );
      PROPERTYSLOT_SET_GET( Real, KmPhos );
      PROPERTYSLOT_SET_GET( Real, KiPhos );
      PROPERTYSLOT_SET_GET( Real, KmGraP );
      PROPERTYSLOT_SET_GET( Real, KiGraP );
      PROPERTYSLOT_SET_GET( Real, KidGraP );
      PROPERTYSLOT_SET_GET( Real, KmB13PG );
      PROPERTYSLOT_SET_GET( Real, KiB13PG );
      PROPERTYSLOT_SET_GET( Real, KidB13PG );
      PROPERTYSLOT_SET_GET( Real, KmNADH );
      PROPERTYSLOT_SET_GET( Real, KiNADH );
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );
    }

  SIMPLE_SET_GET_METHOD( Real, KmNAD );
  SIMPLE_SET_GET_METHOD( Real, KiNAD );
  SIMPLE_SET_GET_METHOD( Real, KmPhos );
  SIMPLE_SET_GET_METHOD( Real, KiPhos );
  SIMPLE_SET_GET_METHOD( Real, KmGraP );
  SIMPLE_SET_GET_METHOD( Real, KiGraP );
  SIMPLE_SET_GET_METHOD( Real, KidGraP );
  SIMPLE_SET_GET_METHOD( Real, KmB13PG );
  SIMPLE_SET_GET_METHOD( Real, KiB13PG );
  SIMPLE_SET_GET_METHOD( Real, KidB13PG );
  SIMPLE_SET_GET_METHOD( Real, KmNADH );
  SIMPLE_SET_GET_METHOD( Real, KiNADH );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    S2 = getVariableReference( "S2" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );

    theKiGraP = ( KiGraP * 2.997 ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.5 ) ) +
	( pow( 10, -10.0 ) / pow( 10, -1 *  E0.getValue() ) ) );

    theKiB13PG = ( KiB13PG * 2.997 ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.5 ) ) +
	( pow( 10, -10.0 ) / pow( 10, -1 *  E0.getValue() ) ) );

    theKmNADH = KmNADH * ( pow( 10, -7.2 ) / pow( 10, -1 * E0.getValue() ) ); 

    theKiNADH = KiNADH * ( pow( 10, -7.2 ) / pow( 10, -1 * E0.getValue() ) ); 
    
    theKcatf = ( kcatf * 2.997 ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.5 ) ) +
	( pow( 10, -10.0 ) / pow( 10, -1 *  E0.getValue() ) ) );

    theKcatr = ( kcatr * 2.997 ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) / pow( 10, -7.5 ) ) +
	( pow( 10, -10.0 ) / pow( 10, -1 *  E0.getValue() ) ) );

  }  
  
  virtual void fire()
  {

    Real gdhrd = ( S0.getMolarConc() / theKiGraP ) * 
      ( 1 + S0.getMolarConc() / KidGraP ) +
      ( P0.getMolarConc() / theKiB13PG ) * 
      ( 1 + S0.getMolarConc() / KidGraP ) +
      ( ( KmB13PG * P1.getMolarConc() ) / ( theKiB13PG * theKmNADH ) ) +
      ( ( KmGraP * S2.getMolarConc() * S1.getMolarConc() ) / 
	( theKiGraP * KmNAD * KiPhos ) ) +
      ( ( S2.getMolarConc() * S0.getMolarConc() ) / ( KiNAD * theKiGraP ) ) +
      ( ( S1.getMolarConc() * S0.getMolarConc() ) / ( KiPhos * theKiGraP ) ) *
      ( 1 + S0.getMolarConc() / KidGraP ) + 
      ( ( S2.getMolarConc() * P0.getMolarConc() ) / ( KiNAD * theKiB13PG ) ) +
      ( ( KmB13PG * S1.getMolarConc() * P1.getMolarConc() ) / 
	( KiPhos * theKiB13PG * theKmNADH ) ) +
      ( ( S0.getMolarConc() * P1.getMolarConc() ) / ( theKiGraP * theKiNADH ) ) +
      ( ( P0.getMolarConc() * P1.getMolarConc() ) / ( theKiB13PG * theKmNADH ) ) +
      ( ( S2.getMolarConc() * S1.getMolarConc() * S0.getMolarConc() ) / 
	( KmNAD * KiPhos * theKiGraP ) ) +
      ( ( KmGraP * S2.getMolarConc() * S1.getMolarConc() * P0.getMolarConc() ) / 
	( theKiGraP * KmNAD * KiPhos * KidB13PG ) ) +
      ( ( S1.getMolarConc() * S0.getMolarConc() * P1.getMolarConc() ) / 
	( KiPhos * theKiGraP * theKiNADH ) ) +
      ( ( KmB13PG * S1.getMolarConc() * P0.getMolarConc() * P1.getMolarConc() ) / 
	( theKiB13PG * theKmNADH * KiPhos * KidB13PG ) );

    Real velocity = ( E1.getMolarConc() / gdhrd ) * 
      ( ( theKcatf * S0.getMolarConc() * S1.getMolarConc() * S2.getMolarConc() ) / 
	( KmNAD * KiPhos * theKiGraP ) -
	( theKcatr * P0.getMolarConc() * P1.getMolarConc() ) /
	( theKiB13PG * theKmNADH ) );
 
    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E2.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theKiGraP;
  Real theKiB13PG;
  Real theKmNADH;
  Real theKiNADH;
  Real theKcatf;
  Real theKcatr;

  VariableReference S0;
  VariableReference S1;
  VariableReference S2;
  VariableReference P0;
  VariableReference P1;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;

  Real KmNAD;
  Real KiNAD;
  Real KmPhos;
  Real KiPhos;
  Real KmGraP;
  Real KiGraP;
  Real KidGraP;
  Real KmB13PG;
  Real KiB13PG;
  Real KidB13PG;
  Real KmNADH;
  Real KiNADH;


  Real kcatf;
  Real kcatr;

};

LIBECS_DM_INIT( TriBiGAPDH_band3_FluxProcess, Process );

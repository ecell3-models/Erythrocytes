#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( HK_Kuchel_GSH_Process, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( HK_Kuchel_GSH_Process, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KiMgATP );
      PROPERTYSLOT_SET_GET( Real, KmMgATP );
      PROPERTYSLOT_SET_GET( Real, KiGlc );
      PROPERTYSLOT_SET_GET( Real, KiGlc6P );
      PROPERTYSLOT_SET_GET( Real, KiMgADP );
      PROPERTYSLOT_SET_GET( Real, KmMgADP );
      PROPERTYSLOT_SET_GET( Real, KdiB23PG );
      PROPERTYSLOT_SET_GET( Real, KdiGlc16P2 );
      PROPERTYSLOT_SET_GET( Real, KdiGlc6P );
      PROPERTYSLOT_SET_GET( Real, KdiGSH );
      PROPERTYSLOT_SET_GET( Real, HK );
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );
      PROPERTYSLOT_SET_GET( Real, K_GSSG );
    }

  SIMPLE_SET_GET_METHOD( Real, KiMgATP );
  SIMPLE_SET_GET_METHOD( Real, KmMgATP );
  SIMPLE_SET_GET_METHOD( Real, KiGlc );
  SIMPLE_SET_GET_METHOD( Real, KiGlc6P );
  SIMPLE_SET_GET_METHOD( Real, KiMgADP );
  SIMPLE_SET_GET_METHOD( Real, KmMgADP );
  SIMPLE_SET_GET_METHOD( Real, KdiB23PG );
  SIMPLE_SET_GET_METHOD( Real, KdiGlc16P2 );
  SIMPLE_SET_GET_METHOD( Real, KdiGlc6P );
  SIMPLE_SET_GET_METHOD( Real, KdiGSH );
  SIMPLE_SET_GET_METHOD( Real, HK );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );
  SIMPLE_SET_GET_METHOD( Real, K_GSSG );


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
    
    theKcatf = 
      ( kcatf * 1.662 ) /
      ( 1 + ( pow( 10, -1.0 * E0.getValue() ) / pow( 10, -7.02 ) ) +
	( pow( 10, -9.55 ) / pow( 10, -1.0 * E0.getValue() ) ) );
    
    theKcatr = 
      ( kcatr * 1.662 ) /
      ( 1 + ( pow( 10, -1.0 * E0.getValue() ) / pow( 10, -7.02 ) ) +
	( pow( 10, -9.55 ) / pow( 10, -1.0 * E0.getValue() ) ) );

  }  
  
  virtual void fire()
  {
    Real hkrd = 
      ( 1 + ( S1.getMolarConc() / KiMgATP ) + 
	( S0.getMolarConc() / KiGlc ) + 
	( ( S1.getMolarConc() * S0.getMolarConc() ) / ( KiGlc * KmMgATP ) ) +
	( P1.getMolarConc() / KiMgADP ) +
	( P0.getMolarConc() / KiGlc6P ) +
	( ( P1.getMolarConc() * P0.getMolarConc() ) / ( KiGlc6P * KmMgADP ) ) +
	( ( E1.getMolarConc() * S0.getMolarConc() ) / ( KdiB23PG * KiGlc ) ) +
	( ( E2.getMolarConc() * S0.getMolarConc() ) / ( KdiGlc16P2 * KiGlc ) ) +
	( ( P0.getMolarConc() * S0.getMolarConc() ) / ( KdiGlc6P * KiGlc ) ) +
	( ( E3.getMolarConc() * S0.getMolarConc() ) / ( KdiGSH * KiGlc ) ) );

    // fix me: * voli?

    Real GG = E3.getMolarConc()/E4.getMolarConc();
    Real velocity =
      (GG/(K_GSSG + GG)) * ( HK / hkrd *
	( ( theKcatf * S0.getMolarConc() * S1.getMolarConc() ) / 
	  ( KiGlc * KmMgATP ) -
	  ( theKcatr * P0.getMolarConc() * P1.getMolarConc() ) /
	  ( KiGlc6P * KmMgADP ) ) );
    
    //velocity = velocity * getSuperSystem()->getSize() * N_A * ( 20.0 / 7.0 );
    velocity = velocity * getSuperSystem()->getSize() * N_A;
    setFlux( velocity );

  }

 protected:
  
  Real KiMgATP;
  Real KmMgATP;
  Real KiGlc;
  Real KiGlc6P;
  Real KiMgADP;
  Real KmMgADP;
  Real KdiB23PG;
  Real KdiGlc16P2;
  Real KdiGlc6P;
  Real KdiGSH;
  Real K_GSSG;
  
  Real HK;
		  
  Real kcatf;
  Real kcatr;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference P1;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;
  VariableReference E3;
    VariableReference E4;

  Real theKcatf;
  Real theKcatr;

};

LIBECS_DM_INIT( HK_Kuchel_GSH_Process, Process );

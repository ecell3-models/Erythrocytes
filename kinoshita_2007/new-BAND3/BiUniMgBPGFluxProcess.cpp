#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniMgBPGFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniMgBPGFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kmgbpg );
      PROPERTYSLOT_SET_GET( Real, Khbpg );
      PROPERTYSLOT_SET_GET( Real, Kmghbpg );
      PROPERTYSLOT_SET_GET( Real, Kh2bpg );
      PROPERTYSLOT_SET_GET( Real, Kkbpg );
      PROPERTYSLOT_SET_GET( Real, Kkhbpg );
      PROPERTYSLOT_SET_GET( Real, kmgbpga );
      PROPERTYSLOT_SET_GET( Real, kmgbpgd );
    }

  SIMPLE_SET_GET_METHOD( Real, Kmgbpg );
  SIMPLE_SET_GET_METHOD( Real, Khbpg );
  SIMPLE_SET_GET_METHOD( Real, Kmghbpg );
  SIMPLE_SET_GET_METHOD( Real, Kh2bpg );
  SIMPLE_SET_GET_METHOD( Real, Kkbpg );
  SIMPLE_SET_GET_METHOD( Real, Kkhbpg );
  SIMPLE_SET_GET_METHOD( Real, kmgbpga );
  SIMPLE_SET_GET_METHOD( Real, kmgbpgd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

    Real mgbpgphf = 3.2 * 0.001 * 
      ( Kmgbpg + pow( 10, -1 * E0.getValue() ) * Khbpg * Kmghbpg ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) * Khbpg ) + 
	( pow( 10, -2 * E0.getValue() ) * Khbpg * Kh2bpg ) +
	( E1.getMolarConc() * Kkbpg ) +
	( E1.getMolarConc() * pow( 10, -1 * E0.getValue() ) * Khbpg * Kkhbpg ) );
    
    theKmgbpga = kmgbpga * mgbpgphf;

  }  
  
  virtual void fire()
  {

    Real velocity = theKmgbpga * S0.getMolarConc() * S1.getMolarConc() -
      kmgbpgd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theKmgbpga;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real Kmgbpg;
  Real Khbpg;
  Real Kmghbpg;
  Real Kh2bpg;
  Real Kkbpg;
  Real Kkhbpg;
  Real kmgbpga;
  Real kmgbpgd;

};

LIBECS_DM_INIT( BiUniMgBPGFluxProcess, Process );
